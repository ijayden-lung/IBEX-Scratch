#!/usr/bin/perl -w
my $threshold = 49;

my %db_hash;
open FILE,"/home/longy/workspace/apa_predict/pas_dataset/hg38.pAs.tianbin.txt";
<FILE>;
while(<FILE>){
	chomp;
	my @data = split;
	my ($chr,$strand) = @data[2,4];
	push @{$db_hash{"$chr:$strand"}},\@data;
}

my %ens_hash;
open FILE,"zcat gencode.v38.annotation.gtf.gz | awk '(\$3==\"transcript\")' | ";
while(<FILE>){
	chomp;
	my ($chr,$start,$end,$strand,$symbol) = (split)[0,3,4,6,15];
	$symbol = s/\"|\;//g;
	my $pos = $end;
	if($strand eq "-"){
		$pos = $start;	
	}
	my $pas_id = "$chr:$pos:$strand";
	my @data = ($pas_id,'Gencode',$chr,$pos,$strand,$symbol);
	push @{$ens_hash{"$chr:$strand"}},\@data;
}

open OUT,">THLE2_Control.pAs.merge.coverage.txt";
while(my ($key,$val) = each %db_hash){
	my @db_data = @$val;
	my $val2 = $ens_hash{$key};
	if(!exists $ens_hash{$key}){
		print "$key\n";
		next;
	}

	my @ens_data = @$val2;
	my $j = 0;
	my $db_pre = 0;
	for(my $i=0;$i<@db_data;$i++){
		my $db_ref = $db_data[$i];
		my $ens_ref = $ens_data[$j];
		my $db_pos = $db_ref->[3];
		my $ens_pos = $ens_ref->[3];
		while($j<@ens_data && $ens_pos < $db_pos-$threshold){
			if($ens_pos > $db_pre+$threshold){
				print OUT join("\t",@$ens_ref),"\n";
			}
			$j++;
			$ens_ref = $ens_data[$j];
			$ens_pos = $ens_ref->[3];
		}
		print OUT join("\t",@$db_ref),"\n";
		$db_pre = $db_pos;
	}
}
