#Hangman game using perl
#Shyam Prajapati 2020CSB1110
use warnings;

# 5.18+
use feature qw( switch );
no warnings qw( experimental::smartmatch );
use feature ":5.10";
use feature qw(switch say);
print "Word guessing game\n";

$play = 'y';
#list of words
@words = (
    "cricket", "shyam",    "apple",      "coder",
    "warrior", "iitropar", "programmer", "maths",
    "physics", "lion",     "tiger","computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","en
viroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","
vampire","ghost","solution","service","software","virus25","security","phonenumber","expert","website","ag
reement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endur
ance","distance","nature","history","organization","international","championship","government","popula
rity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","
priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector
","terminology","design","operation","foundation","application","prediction","reference","measurement","
concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illust
ration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenpl
ay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment"
);

&main();    # call the main method

sub main {

    while ( $play eq 'y' ) {
        $word = @words [int(rand($#words-1)) - 1];

        $solved       = 0;# keeps track if a playes wins
        @guesses      = ();# progress of user
        @wordtillnow  = ();#letters already guessed 
        $num_of_tries = 0;#no. of tries user made
        $size         = length($word);
        print "\n size of word is $size";

        for ( $p = 0 ; $p < $size ; $p++ ) {
            push @guesses, '_';
        }

        $flag = 1;

        while ( !$solved && $num_of_tries < 7 && $flag == 1 ) {
            $flag = &hangmanDisplay($num_of_tries);
            if ( $flag == 1 ) {

                print
"\nGuess a letter (between a and z) or enter an entire word: \n";

                $guess = <STDIN>;
                chomp($guess);    # remove newline
                if ( $guess eq $word ) {
                    $solved = 1;
                }
                else {
                #checks if the guessed letter is correct,wrong or already guessed
                    &checkLetter( $word, $guess, @wordtillnow, @guesses,
                        $num_of_tries );
                        
                    $solved = &checkWin( $word, @guesses );
                    print "word till now: ";
                    print join( " ", @guesses );
                    print "\nletters already guessed: ";
                    print join( ",", @wordtillnow );
                    print "\n";
                }
            }

        }

        if ( $solved == 1 ) {
            print "\n\nYay you win!\n";
        }
        else {
            print "\n\nYou lose!\n";
        }
        print "The word is: " . $word . "\n";

        print "do you want to play again? y/n:";
        $play = <STDIN>;
        chomp($play);

    }

}
#method to check if guess is correct or wrong or already made
sub checkLetter {
    my ( $word, $guess ) = @_;
    my $letterIndex = index( $word, $guess );

    if ( $letterIndex == -1 ) {
        print "Wrong!\n";
        $num_of_tries++;
    }
    else {
        for ( my $i = 0 ; $i < length($word) ; $i++ ) {
            my $let = substr( $word, $i, 1 );
            if ( $guess eq $guesses[$i] ) {
                print "You already guessed $guess!\n";
            }
            elsif ( $guess eq $let ) {
                $guesses[$i] = $let;           #updates the guessed word

            }

        }

    }

    $arrsize = @wordtillnow;
    for ( $d = 0 ; $d < $arrsize ; $d++ ) {
        if ( $wordtillnow[$d] eq $guess ) {
            return;
        }
    }
    push( @wordtillnow, $guess );#pushes the guess

}
#method to determine if player won
sub checkWin {

    my ($word) = @_;
    my $letter;
    for ( my $i = 0 ; $i < length($word) ; $i++ ) {
        $letter = substr( $word, $i, 1 );
        if ( $letter ne $guesses[$i] ) {
            return 0;
        }
    }
    return 1;
}
#display the graph of players progress.once graph completes player loses
sub hangmanDisplay() {
    given ($num_of_tries) {
        when (0) { return &hangman1Display(); }
        when (1) { return &hangman2Display(); }
        when (2) { return &hangman3Display(); }
        when (3) { return &hangman4Display(); }
        when (4) { return &hangman5Display(); }
        when (5) { return &hangman6Display(); }
        when (6) { return &hangman7Display(); }
    }
}

sub hangman1Display {
    print " _\n";
    print "  |     |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
    return 1;
}

sub hangman2Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
    return 1;
}

sub hangman3Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |     |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
    return 1;
}

sub hangman4Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman5Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|/\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
    return 1;
}

sub hangman6Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|/\n";
    print "  |     /\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
    return 1;
}

sub hangman7Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|/\n";
    print "  |     /\\\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";

    #print "You lost!\n";
    return 0;

}

