#! /usr/bin/perl
use warnings; 
use strict;
use 5.010;
use Term::ANSIColor;

#Make Output wait for a keypress
#INPUT: Any key press
#OUTPUT: NONE
#RETURNS: NONE
sub waitForIt
{
	<STDIN>;
}

#Displays the main titlepage of the game
#INPUT: Keypress (via waitForIt)
#OUTPUT: Title Page
#RETURNS: NONE
sub titlePage
{
	system ('clear');
        print (colored("                           ██▓     ▒█████   ▄▄▄▄   ▓█████▄\n", 'bright_blue'));
        print (colored("                          ▓██▒    ▒██▒  ██▒▓█████▄ ▒██▀ ██▌\n", 'bright_blue'));
        print (colored("                          ▒██░    ▒██░  ██▒▒██▒ ▄██░██   █▌\n", 'bright_blue'));
        print (colored("                          ▒██░    ▒██   ██░▒██░█▀  ░▓█▄   ▌\n", 'bright_blue'));
        print (colored("                          ░██████▒░ ████▓▒░░▓█  ▀█▓░▒████▓ \n", 'bright_blue'));
        print (colored("                          ░ ▒░▓  ░░ ▒░▒░▒░ ░▒▓███▀▒ ▒▒▓  ▒ \n", 'bright_blue'));
        print (colored("                          ░ ░ ▒  ░  ░ ▒ ▒░ ▒░▒   ░  ░ ▒  ▒ \n", 'bright_blue'));
        print (colored("                            ░ ░   ░ ░ ░ ▒   ░    ░  ░ ░  ░ \n", 'bright_blue'));
        print (colored("                              ░  ░    ░ ░   ░         ░    \n", 'bright_blue'));
        print (colored("                                                 ░  ░      \n", 'bright_blue'));
print "\n";
print (colored ("                             L", 'bright_yellow'));
print (colored ("egend of the ", 'bright_white')); 
print (colored ("B", 'bright_yellow'));
print (colored ("lue ", 'bright_white')); 
print (colored ("D", 'bright_yellow'));
print (colored ("ragon", 'bright_white'));
print "\n\n";
print "                                        <More>\n";
waitForIt();
}


sub fightFightFight
{
	print "Fight Scene\n";
	waitForIt();
	&forest();
}

sub specialForest
{
	print "Special Forest\n";
	waitForIt();
	&forest();
}

sub searchForest
{
	#Tavern
	#Faries
		#Catch (Healed back to full health instead of dying
		#Ask for a Blessing
			#Healed
			#Gems
			#Experience
			#Companion (Horse) 25% more forest events, go to tavern at will
			#Fary Lore
				#1 time healing
	#Fight Monster
	#Leave a Message
	#Save a Princess
	#Find a Gem
	#Hag for Gem -  If you give her a gem you will be healed and your max Hit Points will go up by one. This is a better deal than the bar tender gives. If you offer a gem but don't have any gems your current HP will be reduced to 1 and you'll have to get healed.
	#Take Old Man to the Main Street (500 * Level * (dragon kills +1))
	#Skill Test
		#Mystical (Pick a number between 1 and 100 6 guesses
		#Fighter Flip a coin
		#Thief Pay a Gem
	#Find a Sack of Gold (5*Level*(dragon kills+1))
	#Ugly / Pretty Stick equivelent
	#Merry Men (1 time healing)
	#Hammerstone (Strength up by 1)
	#Buy or Sell a Horse
	#
	my $whichEvent = int(rand(4) + 1);
	given ($whichEvent)
	{
		when(4)
		{
			&specialForest();
		}
		default
		{
			&fightFightFight();
		}
	}	
}

sub forest
{
	
	#Forest UI
	system ('clear');
	print (colored("Legend of the Blue Dragon --", 'bold bright_white'));
	print (colored(" Forest\n", 'green'));
	print (colored("~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=\n", 'magenta'));
	print (colored(" The dark forest stands before you -- The Wild Calls ...\n\n\n", 'green'));
	print (colored("(", 'green'));
	print (colored("L", 'bright_white'));
	print (colored(")ook for something to kill	(", 'green'));
	print (colored("H", 'bright_white'));
	print (colored(")ealer's Cottage\n", 'green'));
	print (colored("(", 'green'));
	print (colored("R", 'bright_yellow'));
	print (colored(")eturn to Main Street\n\n", 'green'));	
	my @validForestActions = ('L', 'H', 'R', , 'B', '?');
	my $forestAction = &menuInput ("Forest", \@validForestActions);
	given ($forestAction)
	{
		when ('L')
		{
			&searchForest();
		}
		when ('H')
		{
			&healer();
		}
		when ('R')
		{
			&mainStreet();
		}
		when ('B')
		{
			print (colored("You throw your bag of gold into the air.\nA stately raven appears, and catches it.\nMysteriously You know that your gold has been transported to the bank.\n", 'green'));
			waitForIt();
			&forest();  
		}
		when ('?')
		{
			&forest ();
		}
	}
}

sub healer
{
	system('clear');
	print (colored("Legend of the Blue Dragon --", 'bold bright_white'));
	print (colored(" Healer's Cottage\n", 'green'));
	print (colored("~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=\n", 'magenta'));
	print (colored("You enter the cottage of the local healer, The smells of various herbs, tinctures,\n", 'green'));
	print (colored("and poultices fill the air. An old woman asks, how much do you want to be healed?\n\n", 'green'));
	print (colored("(", 'green'));
	print (colored("A", 'bright_white'));
	print (colored(")ll HP Possible\n", 'green'));
	print (colored("(", 'green'));
	print (colored("E", 'bright_white'));
	print (colored(")very HP You Have Gold For\n", 'green'));
	print (colored("(", 'green'));
	print (colored("T", 'bright_white'));
	print (colored(")en HP\n", 'green'));
	print (colored("(", 'green'));
	print (colored("F", 'bright_white'));
	print (colored(")ive HP\n", 'green'));
	print (colored("(", 'green'));
	print (colored("O", 'bright_white'));
	print (colored(")ne HP\n", 'green'));
	print (colored("(", 'green'));
	print (colored("R", 'bright_yellow'));
	print (colored(")eturn\n\n\n", 'green'));
	my @healerOptions = ('A', 'E', 'T', 'F', 'O', 'R', '?');
	my $healOption = &menuInput("Healer's Cottage", \@healerOptions);
	given ($healOption)
	{
		when ('A')
		{

		}

		when ('E')
		{

		}
	
		when ('T')
		{

		}

		when ('F')
		{

		}

		when ('O')
		{

		}

		when ('R')
		{
			&forest();
		}
		when ('?')
		{
			&healer();
		}
	}
}

sub menuInput
{
	#Get passed Values In
	my $locationInGame = shift;
	my $validRef = shift;
	#Dereference the Valid Values Array
	my @valuesToCompare = @$validRef;
	#Create Prompt based on valid values
	my $valuesForPrompt = join(', ',@valuesToCompare);
	$valuesForPrompt = "(".$valuesForPrompt.")\n\n";
	#Print Input Prompt
	print (colored("$locationInGame", 'bright_white'));
	print (colored(" (? for menu)\n", 'blue'));
	print (colored($valuesForPrompt, 'blue'));
	print (colored("Your Command, ", 'green'));
	#Input Until Valid Input Entered
	my $validFlag = 0;
	my $gameAction = '';
	while ($validFlag == 0)
	{
		chomp($gameAction = <STDIN>);
		$gameAction = uc ($gameAction);
		#Determine if the Inputed Value matches a valid value.
		foreach (@valuesToCompare)
		{
			if ($gameAction eq $_)
			{
				$validFlag = 1;
			}	
		}
	}
	return $gameAction;
}

sub mainStreet
{
	system('clear');
#Main Street UI
	print (colored("Legend of the Blue Dragon --", 'bold bright_white'));
	print (colored(" Main Street\n", 'green'));
	print (colored("~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=\n", 'magenta'));
	print (colored("The crowded streets make it difficult to move through the town ...\n", 'green'));
	print "\n";
#Forest and Player Fight
	print (colored("(", 'green'));
	print (colored("F",'bright_white'));
	print (colored(")orest\t\t(", 'green'));
	print (colored("S", 'bright_white'));
	print (colored(")laughter other players\n", 'green'));
#Weapons and Armour
	print (colored("(", 'green'));
	print (colored("W", 'bright_white'));
	print (colored(")eapon Shop\t\t(", 'green'));
	print (colored("A", 'bright_white'));
	print (colored(")rmour Shop\n", 'green'));
#Healer and Stats
	print (colored("(", 'green'));
	print (colored("H", 'bright_white'));
	print (colored(")ealers Hut\t\t(", 'green'));
	print (colored("V", 'bright_white'));
	print (colored(")iew your stats\n", 'green'));
#Inn and Training
	print (colored("(", 'green'));
	print (colored("I", 'bright_white'));
	print (colored(")nn\t\t\tWarrior (", 'green'));
	print (colored("T", 'bright_white'));
	print (colored(")raining\n", 'green'));
#Mail and Online Players
	print (colored("Write (", 'green'));
	print (colored("M", 'bright_white'));
	print (colored(")ail\t\t(", 'green'));
	print (colored("P", 'bright_white'));
	print (colored(")eople Online\n", 'green'));
#Other Places and Expert Mode
	print (colored("(", 'green'));
	print (colored("O", 'bright_white'));
	print (colored(")ther Places\t\te(", 'green'));
	print (colored("X", 'bright_yellow'));
	print (colored(")pert Mode\n", 'green'));
#Quit
	print (colored("(", 'green'));
	print (colored("Q", 'bright_yellow'));
	print (colored(")uit to the fields\n", 'green'));
#Command Prompt
	my @inputValues = ('F','S','W','A','H','V','I','T','M','P','O','X','Q','?');
	my $gameAction = menuInput("Main Street",\@inputValues);
	given ($gameAction)
	{
		when('F')
		{
			&forest ();
		}
		when('S')
		{
		}
		when('W')
		{
		}
		when('A')
		{
		}
		when('H')
		{
			&healer ();
		}
		when('V')
		{
		}
		when('I')
		{
		}
		when('T')
		{
		}
		when('M')
		{
		}
		when('P')
		{
		}
		when('O')
		{
		}
		when('X')
		{
		}
		when('Q')
		{
		}
		when('?')
		{
			&mainStreet ();
		}
	}	
	return $gameAction;
}

sub main
{
	titlePage ();
	my $quitFlag = "aaa";
	while ($quitFlag ne "Q")
	{
		$quitFlag = mainStreet();
	}
}
main ();
