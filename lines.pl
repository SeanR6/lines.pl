#!/usr/bin/perl -l
#use warnings;
use URI;
use Web::Scraper;
use Data::Dumper;
use warnings;

my $inputLoop = 1;
#my $userInput;
my $bat = "--bat=";
my $input;

while($inputLoop == 1){
	#userInput here
	$userInput = <STDIN>;
	chomp $userInput;
	if(index($userInput, $bat) != -1){
		#continue the program as normal, don't need to do anything here
	}elsif($userInput eq ".eot"){
		$inputLoop = 0;
		print "";
	}
	else{
		$input = $userInput;
	}
}
if($input eq "--help" || $input eq "-h"){
	print "lines.pl [input(ex. team name)] (and/or) [--bat=token] | --help (-h) | --synopsis

'lines.pl' returns a list of daily lineups for all nhl teams. Input (function) is a team name or a 
team city (with the exception of New York which has two teams, try nyr or nyi instead), as well as 
some team nicknames. Input will be all lower case only. Space included where ther should
be, ex: 'maple leafs'.

After a team is selected the user will enter .eot to begin searching, if correct entry is input, 
the program will return all the line combiniations for the given team.

Example input:
anaheim
.eot

Version: 1.0.0
Author: Sean Ritchie";
	exit;
}elsif($input eq "--synopsis"){
	print "Daily hockey lines v1.0.0";
	print "This program takes the input of a hockey team and returns the most recently reported lineup for that team.";
	exit;
}



my $teamName;
if($input eq "ducks" ||$input eq "anaheim"){
	$teamName = "anaheim-ducks";
}elsif($input eq "vegas" || $input eq "los vegas" || $input eq "knights" || $input eq "golden knights"){
	$teamName = "vegas-golden-knights";
}elsif($input eq "arizona" || $input eq "coyotes"){
	$teamName = "arizona-coyotes";
}elsif($input eq "boston" || $input eq "bruins"){
	$teamName = "boston-bruins";
}elsif($input eq "buffalo" || $input eq "sabres"){
	$teamName = "buffalo-sabres";
}elsif($input eq "calgary" || $input eq "flames"){
	$teamName = "calgary-flames";
}elsif($input eq "hurricanes" || $input eq "carolina" || $input eq "canes"){
	$teamName = "carolina-hurricanes";
}elsif($input eq "blackhawks" || $input eq "chicago" || $input eq "hawks"){
	$teamName = "chicago-blackhawks";
}elsif($input eq "colorado" || $input eq "avalanche"){
	$teamName = "colorado-avalanche";
}elsif($input eq "columbus" || $input eq "blue jackets" || $input eq "jackets"){
	$teamName = "columbus-blue-jackets";
}elsif($input eq "dallas" || $input eq "stars"){
	$teamName = "dallas-stars";
}elsif($input eq "detroit" || $input eq "red wings" || $input eq "wings"){
	$teamName = "detroit-red-wings";
}elsif($input eq "edmonton" || $input eq "oilers"){
	$teamName = "edmonton-oilers";
}elsif($input eq "florida" || $input eq "panthers"){
	$teamName = "florida-panthers";
}elsif($input eq "la" || $input eq "los angeles" || $input eq "kings"){
	$teamName = "los-angeles-kings";
}elsif($input eq "minnesota" || $input eq "wild"){
	$teamName = "minnesota-wild";
}elsif($input eq "montreal" || $input eq "canadiens" || $input eq "habs"){
	$teamName = "montreal-canadiens";
}elsif($input eq "nashville" || $input eq "predators" || $input eq "preds"){
	$teamName = "nashville-predators";
}elsif($input eq "new jersey" || $input eq "nj" || $input eq "devils"){
	$teamName = "new-jersey-devils";
}elsif($input eq "nyi" || $input eq "islanders"){
	$teamName = "new-york-islanders";
}elsif($input eq "nyr" || $input eq "rangers"){
	$teamName = "new-york-rangers";
}elsif($input eq "ottawa" || $input eq "senators" || $input eq "sens"){
	$teamName = "ottawa-senators";
}elsif($input eq "philadelphia" || $input eq "flyers" || $input eq "philly"){
	$teamName = "philadelphia-flyers";
}elsif($input eq "pittsburgh" || $input eq "penguins" || $input eq "pens"){
	$teamName = "pittsburgh-penguins";
}elsif($input eq "san jose" || $input eq "sj" || $input eq "sharks"){
	$teamName = "san-jose-sharks";
}elsif($input eq "st lous" || $input eq "blues"){
	$teamName = "st-louis-blues";
}elsif($input eq "tampa bay" || $input eq "tampa" || $input eq "tb" || $input eq "lightning"){
	$teamName = "tampa-bay-lightning";
}elsif($input eq "toronto" || $input eq "maple leafs" || $input eq "leafs"){
	$teamName = "toronto-maple-leafs";
}elsif($input eq "vancouver" || $input eq "canucks"){
	$teamName = "vancouver-canucks";
}elsif($input eq "washington" || $input eq "caps" || $input eq "capitals"){
	$teamName = "washington-capitals";
}elsif($input eq "winnipeg" || $input eq "jets"){
	$teamName = "winnipeg-jets";
}else{
	die "invalid input, try -h then .eot for help.\n"
}









my $urlToScrape = "https://www.dailyfaceoff.com/teams/$teamName/line-combinations/";
#looks for html with the tag player-name
my $data = scraper {
	process ".player-name", "name[]" => "TEXT";
};

my $res = $data->scrape(URI->new($urlToScrape));


#figure out how to get size of array?
#my $arrSize = @arr;
my $player = $res->{name}[0];
print "PROGRAM OUTPUT";
print "==============";
print "Forwards style for each line: LW, C, RW";
print "Line 1:";
print $res->{name}[0];
print $res->{name}[1];
print $res->{name}[2];
print "\nLine 2:";
print $res->{name}[3];
print $res->{name}[4];
print $res->{name}[5];
print "\nLine 3:";
print $res->{name}[6];
print $res->{name}[7];
print $res->{name}[8];
print "\nLine 4:";
print $res->{name}[9];
print $res->{name}[10];
print $res->{name}[11];
print "\nDefense pairings:";
print "Pair 1:";
print $res->{name}[12];
print $res->{name}[13];
print "\nPair 2:";
print $res->{name}[14];
print $res->{name}[15];
print "\nPair3:";
print $res->{name}[16];
print $res->{name}[17];
print "\nPowerplay unit format: LW, C, RW, D, D";
print "Powerplay unit 1:";
print $res->{name}[18];
print $res->{name}[19];
print $res->{name}[20];
print $res->{name}[21];
print $res->{name}[22];
print "\nPowerplay unit 2:";
print $res->{name}[23];
print $res->{name}[24];
print $res->{name}[25];
print $res->{name}[26];
print $res->{name}[27];
print "\nGoalies:";
print $res->{name}[28];
print $res->{name}[29];
print "\nInjured Players:";
for my $i (30 .. $#{$res->{name}}) {
	print $res->{name}[$i];
}
