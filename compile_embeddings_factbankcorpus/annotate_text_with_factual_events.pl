#! /usr/bin/perl
### Program to annotate factbank corpus with factual annotations
#Usage: perl annotate_text_with_factual_events.pl corpus_directory annotation_file outfput_file

opendir(DIR,$ARGV[0]) or die(" can't open input directory containing text");

open(DICTF,$ARGV[1]) or die(" can't open fact annotations file");

open(FO,">fact_annotated_corpus.txt") or die ("can't open file for writing");


#File and factual events dictionary
%fact_dict = ();

while(my $line = <DICTF>){

       $line =~ s/[\r\n]//;

       my($fname, $fact) = split(/\t/,$line);
       $fact_dict{$fname} = $fact;
}
close(DICTF);
 	
#Read all files from the corpus directory
my @files = readdir(DIR);

#Read each textual file and substitute factual annotations using the events-annotations from the dcitioanry
foreach my $file(@files){
       local $/;
       open(FI,"<$ARGV[0]/$file");
       $text = <FI>;  	
       close(FI);	
  #consider text from TEXT tag
  if ($text =~/<TEXT>(.*?)<\/TEXT>/sg)
  {
      $text = $1;
      $text =~ s/\n/ /g;
      $text =~ s/\s+/ /g;
      $text =~ s/[[:punct:]]//g;

      my $factclass = $fact_dict{$file};
      my($class,@factevents) = split(/\_/,$factclass);
      foreach my $e(@factevents){		    
	      $text =~ s/$e/$class/ig;
      }
      print FO "$text\n";	  
 }
 else{

      my $factclass = $fact_dict{$file};
      my($class,@factevents) = split(/\_/,$factclass);

      foreach my $e(@factevents){
              $text =~ s/$e/$class/ig;
      }	
      $text =~ s/\n/ /g;
      $text =~ s/\s+/ /g;	
      $text =~ s/[[:punct:]]//g;
      print FO "$text\n";
 } 

}

close(FO);



