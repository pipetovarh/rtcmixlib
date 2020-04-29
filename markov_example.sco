sr = 44100
outchans = 2
rtsetparams(sr, outchans)
control_rate(sr)
srand()
load("WAVETABLE")
tblsize = 1000

include fthlib.sco // function library

datasetList = // sequence of quadruples of time interval before next note (ms), MIDI pitch, velocity (0-127), and duration (ms)
{
    {{0, 50, 75, 3000}, {1000, 43, 25, 3000}, {0, 59, 25, 2000}, {0, 62, 25, 2000}, {2000, 66, 25, 2000}, {1000, 38, 25, 3000}, {0, 57, 25, 2000}, {0, 61, 25, 2000}, {2000, 66, 25, 2000}, {1000, 43, 50, 3000}, {0, 59, 25, 2000}, {0, 62, 25, 2000}, {2000, 66, 25, 2000}, {1000, 38, 25, 3000}, {0, 57, 50, 2000}, {0, 61, 50, 2000}, {2000, 66, 50, 2000}, {1000, 43, 25, 3000}, {0, 78, 50, 1000}, {0, 59, 50, 2000}, {0, 62, 50, 2000}, {1000, 66, 50, 2000}, {1000, 81, 50, 1000}, {0, 79, 50, 1000}, {1000, 38, 50, 3000}, {0, 78, 50, 1000}, {0, 57, 50, 2000}, {0, 61, 50, 2000}, {1000, 66, 50, 2000}, {1000, 73, 50, 1000}, {0, 71, 50, 1000}, {1000, 43, 50, 3000}, {0, 73, 50, 1000}, {0, 59, 50, 2000}, {0, 62, 50, 2000}, {1000, 66, 50, 2000}, {1000, 74, 75, 1000}, {0, 69, 50, 2800}, {1000, 38, 50, 3000}, {0, 57, 50, 2000}, {0, 61, 50, 2000}, {2000, 66, 50, 2000}, {0, 66, 75, 3000}, {1000, 43, 75, 3000}, {0, 59, 75, 2000}, {0, 62, 75, 2000}, {2000, 66, 75, 5000}, {1000, 38, 75, 3000}, {0, 57, 75, 2000}, {0, 61, 75, 2000}, {2000, 66, 75, 5000}, {1000, 43, 100, 3000}, {0, 59, 75, 2000}, {0, 62, 75, 2000}, {2000, 66, 75, 5000}, {1000, 38, 75, 3000}, {0, 57, 75, 2000}, {0, 61, 75, 2000}, {2000, 66, 75, 2000}, {1000, 43, 100, 3000}, {0, 78, 25, 1000}, {0, 59, 25, 2000}, {0, 62, 25, 2000}, {1000, 66, 25, 2000}, {1000, 81, 50, 1000}, {0, 79, 50, 1000}, {1000, 38, 50, 3000}, {0, 78, 50, 1000}, {0, 57, 50, 2000}, {0, 61, 50, 2000}, {1000, 66, 50, 2000}, {1000, 73, 50, 1000}, {0, 71, 50, 1000}, {1000, 43, 50, 3000}, {0, 73, 50, 1000}, {0, 59, 50, 2000}, {0, 62, 50, 2000}, {1000, 66, 50, 2000}, {1000, 74, 50, 1000}, {0, 69, 50, 3100}, {1000, 38, 50, 3000}, {0, 57, 50, 2000}, {0, 61, 50, 2000}, {2000, 66, 50, 2000}, {0, 73, 75, 3100}, {1000, 42, 75, 3000}, {0, 57, 50, 2000}, {0, 61, 50, 2000}, {2000, 66, 50, 2000}, {0, 78, 50, 3100}, {1000, 35, 50, 3000}, {0, 59, 50, 2000}, {0, 62, 50, 2000}, {2000, 66, 50, 2000}, {0, 64, 25, 8500}, {1000, 40, 25, 3000}, {0, 55, 25, 2000}, {2000, 59, 25, 2000}, {1000, 40, 50, 3000}, {0, 59, 25, 2000}, {0, 62, 25, 2000}, {2000, 67, 25, 2000}, {1000, 38, 25, 3000}, {0, 53, 25, 2000}, {0, 57, 25, 2000}, {2000, 62, 25, 2000}, {0, 69, 75, 1000}, {1000, 33, 50, 3000}, {0, 71, 75, 1000}, {0, 57, 50, 2000}, {0, 60, 50, 2000}, {1000, 64, 50, 2000}, {1000, 72, 75, 1000}, {0, 76, 75, 1000}, {1000, 38, 75, 3000}, {0, 74, 75, 1000}, {0, 55, 50, 2000}, {0, 59, 50, 2000}, {1000, 64, 50, 2000}, {1000, 71, 50, 1000}, {0, 74, 75, 1000}, {1000, 38, 75, 3000}, {0, 72, 75, 1000}, {0, 50, 75, 2000}, {0, 55, 75, 2000}, {0, 59, 75, 2000}, {1000, 64, 75, 2000}, {1000, 71, 75, 1000}, {0, 74, 75, 4800}, {1000, 38, 75, 3000}, {0, 48, 50, 2000}, {0, 52, 50, 2000}, {0, 57, 50, 2000}, {2000, 62, 50, 2000}, {1000, 38, 75, 3000}, {0, 48, 50, 2000}, {0, 54, 50, 2000}, {0, 57, 50, 2000}, {1000, 62, 50, 2000}, {1000, 74, 75, 1000}, {0, 76, 75, 1000}, {1000, 38, 75, 3000}, {0, 77, 75, 1000}, {0, 57, 50, 2000}, {0, 60, 50, 2000}, {1000, 65, 50, 2000}, {1000, 79, 75, 1000}, {0, 81, 75, 1000}, {1000, 38, 75, 3000}, {0, 72, 50, 1000}, {0, 57, 50, 2000}, {0, 60, 50, 2000}, {1000, 64, 50, 2000}, {1000, 74, 75, 1000}, {0, 76, 75, 1000}, {1000, 38, 75, 3000}, {0, 74, 75, 1000}, {0, 50, 50, 2000}, {0, 55, 50, 2000}, {0, 59, 50, 2000}, {1000, 64, 50, 2000}, {1000, 71, 50, 1000}, {0, 74, 75, 4800}, {1000, 38, 50, 3000}, {0, 48, 50, 2000}, {0, 52, 50, 2000}, {0, 57, 50, 2000}, {2000, 62, 50, 2000}, {1000, 38, 75, 3000}, {0, 48, 50, 2000}, {0, 54, 50, 2000}, {0, 57, 50, 2000}, {1000, 62, 50, 2000}, {1000, 74, 50, 1000}, {0, 79, 75, 3100}, {1000, 40, 75, 3000}, {0, 59, 75, 2000}, {0, 64, 75, 2000}, {2000, 67, 75, 2000}, {0, 78, 75, 3100}, {1000, 42, 75, 3000}, {0, 57, 75, 2000}, {0, 61, 75, 2000}, {2000, 66, 75, 2000}, {0, 71, 50, 1000}, {1000, 35, 50, 3000}, {0, 69, 75, 1000}, {0, 59, 75, 2000}, {0, 62, 75, 2000}, {1000, 66, 75, 2000}, {1000, 71, 75, 1000}, {0, 73, 75, 1000}, {1000, 40, 75, 3000}, {0, 74, 75, 1000}, {0, 61, 50, 2000}, {0, 64, 50, 2000}, {1000, 69, 50, 2000}, {1000, 76, 75, 1000}, {0, 73, 75, 1000}, {1000, 40, 75, 3000}, {0, 74, 75, 1000}, {0, 57, 50, 2000}, {0, 61, 50, 2000}, {0, 66, 50, 2000}, {1000, 69, 50, 2000}, {1000, 76, 75, 1000}, {0, 66, 50, 2000}, {1000, 40, 75, 3000}, {0, 47, 50, 1000}},
    {{0,56,50,3300}, {600,41,50,2400}, {0,72,50,300}, {0,56,50,1200}, {0,60,50,1200}, {300,65,50,1200}, {300,75,50,300}, {600,74,50,600}, {0,72,50,500}, {0,56,50,600}, {0,60,50,600}, {550,65,50,600}, {100,72,50,100}, {0,71,50,1200}, {600,41,50,2400}, {0,56,50,1200}, {0,60,50,1200}, {550,65,50,1200}, {50,72,50,0}, {600,71,50,1200}, {0,56,50,600}, {0,60,50,600}, {600,65,50,600}, {600,41,50,2400}, {0,72,50,300}, {0,56,50,1200}, {0,60,50,1200}, {300,65,50,1200}, {300,75,75,300}, {600,74,50,600}, {0,72,50,600}, {0,56,75,600}, {0,60,75,600}, {550,65,75,600}, {50,76,75,0}, {0,77,75,1200}, {600,41,50,2400}, {0,56,50,1200}, {0,60,50,1200}, {550,65,50,1200}, {50,76,50,0}, {600,77,50,1200}, {0,56,50,600}, {0,60,50,600}, {600,65,50,600}, {600,41,75,2400}, {0,72,50,300}, {0,56,50,1200}, {0,60,50,1200}, {300,65,50,1200}, {300,75,50,300}, {600,74,75,600}, {0,72,50,500}, {0,56,50,600}, {0,60,50,600}, {550,65,50,600}, {100,72,50,100}, {0,71,50,1200}, {600,41,50,2400}, {0,56,50,1200}, {0,60,50,1200}, {550,65,50,1200}, {50,68,50,0}, {600,67,50,1200}, {0,56,50,600}, {0,60,50,600}, {550,65,50,600}, {50,65,50,0}, {0,67,50,600}, {550,48,75,2400}, {50,65,75,0}, {0,67,75,1500}, {0,51,50,1200}, {0,55,50,1200}, {1200,60,50,1200}, {0,51,50,600}, {0,55,50,600}, {550,60,50,600}, {50,68,50,0}, {0,67,100,600}, {550,41,100,2400}, {50,67,100,0}, {0,65,100,1200}, {0,56,100,1200}, {0,60,100,1200}, {1200,65,100,1800}, {0,56,100,600}, {0,60,100,600}, {600,65,100,2400}, {600,41,100,2400}, {0,56,75,1200}, {0,60,75,1200}, {1200,65,75,1800}, {0,56,100,600}, {0,60,100,600}, {600,65,100,600}, {600,41,50,2400}, {0,72,50,300}, {0,56,50,1200}, {0,60,50,1200}, {300,65,50,1200}, {300,75,75,300}, {600,74,50,600}, {0,72,50,500}, {0,56,50,600}, {0,60,50,600}, {550,65,50,600}, {100,72,50,100}, {0,71,50,1200}, {600,41,50,2400}, {0,56,50,1200}, {0,60,50,1200}, {550,65,50,1200}, {50,72,50,0}, {600,71,50,1200}, {0,56,50,600}, {0,60,50,600}, {600,65,50,600}, {600,41,50,2400}, {0,72,50,300}, {0,56,50,1200}, {0,60,50,1200}, {300,65,50,1200}, {300,75,50,300}, {600,74,50,600}, {0,72,50,600}, {0,56,75,600}, {0,60,75,600}, {550,65,75,600}, {50,76,50,0}, {0,77,50,1200}, {600,41,75,2400}, {0,56,50,1200}, {0,60,50,1200}, {550,65,50,1200}, {50,76,50,0}, {600,77,50,1200}, {0,56,50,600}, {0,60,50,600}, {600,65,50,600}, {600,41,75,2400}, {0,72,50,300}, {0,56,50,1200}, {0,60,50,1200}, {300,65,50,1200}, {300,75,50,300}, {600,74,75,600}, {0,72,50,500}, {0,56,75,600}, {0,60,75,600}, {550,65,75,600}, {100,72,50,100}, {0,71,50,1200}, {600,41,50,2400}, {0,56,50,1200}},
    {{0,67,100,300}, {0,76,100,300}, {0,79,100,300}, {0,83,100,300}, {0,47,100,200}, {0,43,100,200}, {0,55,100,200}, {600,40,100,200}, {0,70,50,200}, {150,46,75,200}, {0,74,25,200}, {150,50,50,200}, {0,77,50,200}, {150,53,50,200}, {0,80,50,200}, {150,56,75,200}, {0,79,50,200}, {150,55,50,200}, {0,77,50,200}, {150,53,50,200}, {0,74,25,200}, {150,50,25,200}, {0,71,50,200}, {150,47,50,200}, {0,80,25,200}, {150,56,75,200}, {0,79,25,200}, {150,55,50,200}, {0,74,50,200}, {150,50,50,200}, {0,71,25,200}, {150,47,50,200}, {0,70,50,200}, {150,46,50,200}, {0,74,50,200}, {150,50,50,200}, {0,77,25,200}, {150,53,50,200}, {0,80,50,200}, {150,56,50,200}, {0,79,50,200}, {150,55,50,200}, {0,77,25,200}, {150,53,50,200}, {0,74,50,200}, {150,50,50,200}, {0,71,50,200}, {750,47,50,200}, {0,67,100,300}, {0,76,100,300}, {0,79,100,300}, {0,83,100,300}, {0,55,100,300}, {0,47,125,300}, {0,40,125,300}, {600,43,100,300}, {0,70,50,200}, {150,46,50,200}, {0,74,25,200}, {150,50,50,200}, {0,77,25,200}, {150,53,50,200}, {0,80,50,200}, {150,56,75,200}, {0,69,50,200}, {150,45,50,200}, {0,74,50,200}, {150,50,50,200}, {0,77,25,200}, {150,53,50,200}, {0,80,50,200}, {150,56,50,200}, {0,69,25,200}, {150,45,50,200}, {0,74,50,200}, {150,50,50,200}, {0,77,25,200}, {150,53,50,200}, {0,80,50,200}, {150,56,50,200}, {0,79,50,200}, {150,55,50,200}, {0,77,50,200}, {150,53,50,200}, {0,74,50,200}, {150,50,50,200}, {0,69,25,200}, {150,45,50,200}, {0,80,50,200}, {150,56,75,200}, {0,77,25,200}, {150,53,50,200}, {0,74,25,200}, {150,50,50,200}, {0,69,25,200}, {150,45,50,200}, {0,77,25,200}, {150,53,50,200}, {0,74,25,200}, {150,50,50,200}, {0,67,25,200}, {150,43,50,200}, {0,66,75,200}, {150,42,50,200}, {0,67,100,300}, {0,76,100,200}, {0,79,100,200}, {0,83,100,200}, {0,47,100,200}, {0,40,100,200}, {0,43,100,200}, {600,55,125,200}, {0,80,50,200}, {150,56,75,200}, {0,77,25,200}, {150,53,50,200}, {0,74,25,200}, {150,50,50,200}, {0,69,25,200}, {150,45,50,200}, {0,77,0,200}, {150,53,50,200}, {0,74,25,200}, {150,50,25,200}, {0,67,25,200}, {150,43,50,200}, {0,66,75,200}, {150,42,50,200}, {0,77,50,200}, {150,53,50,200}, {0,74,25,200}, {150,50,50,200}, {0,67,25,200}, {150,43,50,200}, {0,66,50,200}, {150,42,50,200}, {0,76,50,200}, {150,52,50,200}, {0,72,50,200}, {150,55,50,200}, {0,67,50,200}, {150,60,50,200}, {0,65,100,200}, {150,65,50,200}, {0,74,25,200}, {150,62,75,200}, {0,71,50,200}, {150,59,50,200}, {0,67,25,200}, {150,55,50,200}, {0,65,50,200}, {150,53,50,200}, {0,62,50,200}, {150,59,50,200}, {0,58,50,200}, {150,56,75,200}},
    {{0,36,100,200}, {50,36,25,100}, {50,48,25,4300}, {100,55,25,100}, {100,60,25,100}, {100,62,25,100}, {100,64,25,100}, {100,55,25,100}, {100,60,25,100}, {100,64,25,100}, {100,62,25,100}, {100,53,25,100}, {100,60,25,100}, {100,62,25,100}, {100,65,25,100}, {100,57,25,100}, {100,59,25,100}, {100,65,25,100}, {100,64,25,100}, {100,55,25,100}, {100,60,25,100}, {100,64,25,100}, {100,67,25,100}, {100,59,25,100}, {100,60,25,100}, {100,67,25,100}, {100,65,50,100}, {100,57,25,100}, {100,60,25,100}, {100,65,25,100}, {100,69,50,100}, {100,59,25,100}, {100,65,25,100}, {100,69,25,100}, {100,67,50,100}, {100,60,25,100}, {100,64,25,100}, {100,67,25,100}, {0,72,50,200}, {100,60,25,1900}, {100,64,50,100}, {100,67,50,100}, {100,72,25,100}, {0,74,50,200}, {100,59,25,500}, {100,64,50,100}, {100,67,50,100}, {100,74,25,100}, {0,72,50,200}, {100,57,25,500}, {100,64,50,100}, {100,67,50,100}, {100,72,50,100}, {0,71,50,200}, {100,59,25,500}, {100,64,50,100}, {100,67,50,100}, {100,71,25,100}, {0,69,50,200}, {100,60,25,500}, {100,64,25,100}, {100,67,25,100}, {100,69,25,100}, {0,67,50,200}, {100,59,25,500}, {100,60,25,100}, {100,64,25,100}, {100,67,25,100}, {0,65,50,200}, {100,57,25,500}, {100,60,25,100}, {100,64,25,100}, {100,65,25,100}, {0,64,50,400}, {100,55,25,500}, {100,59,25,100}, {100,60,25,100}, {100,64,25,100}, {0,62,25,400}, {100,53,25,500}, {100,57,25,100}, {100,60,25,100}, {100,62,25,100}, {0,67,50,400}, {100,52,25,500}, {100,59,25,100}, {100,64,25,100}, {100,67,25,100}, {0,69,50,400}, {100,57,25,500}, {100,60,25,100}, {100,64,25,100}, {100,69,25,100}, {0,64,50,400}, {100,55,25,500}, {100,57,25,100}, {100,60,25,100}, {100,64,25,100}, {0,62,50,400}, {100,53,25,500}, {100,57,25,100}, {100,60,25,100}, {100,62,25,100}, {0,60,25,400}, {100,52,25,500}, {100,55,25,100}, {100,57,25,100}, {100,60,25,100}, {0,59,25,400}, {100,50,25,500}, {100,53,25,100}, {100,55,25,100}, {100,59,25,100}, {100,41,25,1900}, {100,48,25,100}, {100,50,25,100}, {100,52,25,100}, {100,53,25,100}, {100,57,25,100}, {100,60,25,100}, {100,62,25,100}, {100,64,50,100}, {100,62,50,100}, {100,60,50,100}, {100,57,25,100}, {100,53,25,100}, {100,52,25,100}, {100,50,25,100}, {100,48,25,100}, {100,41,25,1900}, {100,48,25,100}, {100,50,25,100}, {100,52,25,100}, {100,53,25,100}, {100,57,25,100}, {100,60,50,100}, {100,62,50,100}, {100,64,50,100}, {100,62,50,100}, {100,60,50,100}, {100,59,25,100}, {100,57,25,100}, {100,52,25,100}, {100,50,25,100}, {100,48,25,100}, {100,41,25,1900}, {100,48,25,100}, {100,50,25,100}, {100,52,25,100}, {100,53,25,100}, {100,56,25,100}, {100,60,50,100}, {100,62,50,100}, {100,71,50,100} , {0,60,50,1000}, {100,67,50,500}, {100,76,50,100}, {100,72,50,100}, {100,64,50,100}, {100,69,50,200}, {100,76,50,100}, {100,71,50,200}, {100,64,50,100}, {0,60,50,1000}, {100,67,50,500}, {100,76,50,100}, {100,72,50,100}, {100,64,50,100}, {100,69,50,200}, {100,76,50,100}, {100,71,50,200}, {100,64,50,100}, {0,60,50,500}, {100,67,50,500}, {100,76,50,100}, {100,72,50,100}, {100,64,50,100}, {0,63,50,500}, {100,70,50,500}, {100,79,50,100}, {100,75,50,100}, {100,67,50,100}, {0,73,75,500}, {100,66,50,500}, {100,82,50,100}, {100,78,50,100}, {100,70,50,100}, {0,67,50,500}, {100,74,75,500}, {100,83,75,100}, {100,79,50,100}, {100,71,50,100}, {100,79,75,1000}, {100,88,75,100}, {100,84,50,100}, {100,76,50,100}, {100,72,75,500}, {100,88,75,100}, {100,84,50,100}, {100,76,50,100}, {100,67,75,1000}, {100,76,75,100}, {100,72,50,100}, {100,64,50,100}, {100,60,75,500}, {100,76,75,100}, {100,72,50,100}, {100,64,50,100}, {100,55,75,500}, {100,64,75,100}, {100,60,50,100}, {100,52,50,100}, {100,48,75,500}, {100,64,75,100}, {100,60,50,100}, {100,52,50,100}, {100,43,75,500}, {100,64,75,100}, {100,60,50,100}, {100,52,50,100}, {100,36,75,500}, {100,64,75,100}, {100,60,75,100}, {100,52,75,100}, {0,52,75,2900}, {0,48,75,2900}, {0,41,75,3800}, {2900,45,75,3800}, {0,47,75,1000}, {950,50,75,1000}, {0,52,75,200}, {0,48,75,200}, {0,43,50,200}, {1900,36,50,200}, {0,24,75,200}},
    {{0,36,100,200}, {0,60,50,4300}, {0,44,50,4300}, {1050,56,25,1100}, {1050,51,25,1100}, {1050,56,25,1100}, {1050,51,25,1100}, {0,58,50,4300}, {0,49,25,4300}, {1050,55,25,1100}, {1050,51,25,1100}, {1050,55,25,1100}, {1050,51,25,1100}, {0,63,50,6400}, {0,48,50,4300}, {1050,56,25,1100}, {1050,51,25,1100}, {1050,56,25,1100}, {1050,51,25,1100}, {0,43,25,4300}, {1050,58,25,1100}, {1050,51,25,1100}, {0,61,50,27900}, {1050,58,25,1100}, {1050,51,25,1100}, {0,60,50,2100}, {0,44,25,2100}, {1050,56,25,1100}, {1050,51,25,1100}, {0,63,50,2100}, {0,43,25,2100}, {1050,58,25,1100}, {1050,51,25,1100}, {0,68,50,2100}, {0,41,50,2100}, {1050,60,25,1100}, {1050,56,25,1100}, {0,70,50,2100}, {0,53,50,2100}, {1050,62,25,1100}, {1050,56,25,1100}, {0,63,50,6400}, {0,51,25,4300}, {1050,55,25,1100}, {1050,58,25,1100}, {1050,55,25,1100}, {1050,58,25,1100}, {0,39,25,4300}, {1050,55,25,1100}, {1050,58,25,1100}, {0,64,50,2100}, {1050,55,25,1100}, {1050,58,25,1100}, {0,65,50,4300}, {0,37,50,245400}, {1050,55,25,1100}, {1050,58,25,1100}, {1050,55,25,1100}, {1050,58,25,1100}, {0,58,50,3200}, {0,49,25,4300}, {1050,55,25,1100}, {1050,51,25,1100}, {1050,55,25,1100}, {0,60,50,500}, {550,51,25,1100}, {550,61,50,13400}, {0,63,50,4300}, {0,48,50,4300}, {1050,56,25,1100}, {1050,51,25,1100}, {1050,56,25,1100}, {1050,51,25,1100}, {0,57,50,4300}, {0,41,25,4300}, {1050,51,25,1100}, {1050,48,25,1100}, {1050,51,25,1100}, {1050,48,25,1100}, {0,61,50,206800}, {0,34,50,4300}, {1050,53,25,1100}, {1050,49,25,1100}, {1050,53,25,1100}, {1050,49,25,1000}, {0,60,50,1100}, {0,39,25,4300}, {1050,49,25,1000}, {0,58,50,1100}, {1050,49,25,1000}, {0,56,50,1100}, {1050,49,25,1000}, {0,55,50,1100}, {1050,49,25,1000}, {0,55,50,4300}, {0,58,50,4300}, {0,32,25,2100}, {1050,49,25,1100}, {1050,51,25,1100}, {0,44,25,2100}, {1050,49,25,1100}, {1050,51,25,1100}, {0,56,50,2100}, {0,48,25,500}, {700,32,25,2100}, {700,51,25,500}, {700,56,25,500}, {700,60,25,500}, {700,63,25,500}, {700,68,25,500}, {0,72,50,4300}, {0,60,25,1100}, {0,44,50,4300}, {1050,56,25,1100}, {0,63,25,1100}, {1050,51,25,1100}, {0,60,25,1100}, {1050,56,25,1100}, {0,63,25,1100}, {1050,51,25,1100}, {0,70,50,4300}, {0,58,25,1100}, {0,49,25,4300}, {1050,55,25,1100}, {0,63,25,1100}, {1050,51,25,1100}, {0,58,25,1100}, {1050,55,25,1100}, {0,63,25,1100}, {1050,51,25,1100}, {0,75,50,6400}, {0,63,25,1100}, {0,48,50,4300}, {1050,56,25,1100}, {0,68,25,1100}, {1050,51,25,1100}, {0,63,25,1100}, {1050,56,25,1100}, {0,68,25,1100}, {1050,51,25,1100}, {0,63,25,1100}, {0,43,25,4300}, {1050,55,25,1100}, {0,70,25,1100}, {1050,51,25,1100}, {0,73,50,2100}, {0,63,25,1100}, {1050,55,25,1100}, {0,36,100,200} , {0,60,50,4300}, {0,44,50,4300}, {1050,56,25,1100}, {1050,51,25,1100}, {1050,56,25,1100}, {1050,51,25,1100}, {0,58,50,4300}, {0,49,25,4300}, {1050,55,25,1100}, {1050,51,25,1100}, {1050,55,25,1100}, {1050,51,25,1100}, {0,63,50,6400}, {0,48,50,4300}, {1050,56,25,1100}, {1050,51,25,1100}, {1050,56,25,1100}, {1050,51,25,1100}, {0,43,25,4300}, {1050,58,25,1100}, {1050,51,25,1100}, {0,61,50,27900}, {1050,58,25,1100}, {1050,51,25,1100}, {0,60,50,2100}, {0,44,25,2100}, {1050,56,25,1100}, {1050,51,25,1100}, {0,63,50,2100}, {0,43,25,2100}, {1050,58,25,1100}, {1050,51,25,1100}, {0,68,50,2100}, {0,41,50,2100}, {1050,60,25,1100}, {1050,56,25,1100}, {0,70,50,2100}, {0,53,50,2100}, {1050,62,25,1100}, {1050,56,25,1100}, {0,63,50,6400}, {0,51,25,4300}, {1050,55,25,1100}, {1050,58,25,1100}, {1050,55,25,1100}, {1050,58,25,1100}, {0,39,25,4300}, {1050,55,25,1100}, {1050,58,25,1100}, {0,64,50,2100}, {1050,55,25,1100}, {1050,58,25,1100}, {0,65,50,4300}, {0,37,50,245400}, {1050,55,25,1100}, {1050,58,25,1100}, {1050,55,25,1100}, {1050,58,25,1100}, {0,58,50,3200}, {0,49,25,4300}, {1050,55,25,1100}, {1050,51,25,1100}, {1050,55,25,1100}, {0,60,50,500}, {550,51,25,1100}, {550,61,50,13400}, {0,63,50,4300}, {0,48,50,4300}, {1050,56,25,1100}, {1050,51,25,1100}, {1050,56,25,1100}, {1050,51,25,1100}, {0,57,50,4300}, {0,41,25,4300}, {1050,51,25,1100}},
    {{0,60,25,4800} , {0,72,100,700}, {600,48,100,700}, {0,63,75,700}, {600,55,75,700}, {0,62,75,700}, {600,53,75,700}, {0,63,75,700}, {600,55,75,700}, {0,51,75,700}, {600,60,75,700}, {0,55,75,700}, {600,63,75,700}, {0,62,75,700}, {600,53,75,700}, {0,63,75,600}, {600,55,75,600}, {0,72,100,700}, {600,48,100,700}, {0,55,75,700}, {600,63,75,700}, {0,53,75,700}, {600,62,75,700}, {0,63,75,700}, {600,55,75,700}, {50,60,75,700}, {600,51,75,700}, {0,63,75,700}, {600,55,75,700}, {0,53,75,700}, {600,62,75,700}, {0,63,75,600}, {600,55,75,600}, {0,68,100,700}, {600,48,100,700}, {50,56,75,700}, {600,65,75,700}, {0,55,75,700}, {600,64,75,700}, {50,65,75,700}, {600,56,75,700}, {0,60,75,700}, {600,53,75,700}, {0,65,75,700}, {600,56,75,700}, {0,55,75,700}, {600,64,75,700}, {0,65,75,600}, {600,56,75,600}, {0,48,100,700}, {600,68,100,700}, {0,56,75,700}, {600,65,75,700}, {0,55,75,700}, {600,64,75,700}, {0,65,75,700}, {600,56,75,700}, {0,60,75,700}, {600,53,75,700}, {0,65,75,700}, {600,56,75,700}, {0,64,75,700}, {600,55,75,700}, {50,65,75,600}, {600,56,75,600}, {0,71,100,700}, {600,48,100,700}, {0,56,75,700}, {600,65,75,700}, {0,63,75,700}, {600,55,75,700}, {0,65,75,700}, {600,56,75,700}, {0,62,75,700}, {600,53,75,700}, {0,56,75,700}, {600,65,75,700}, {0,55,75,700}, {600,63,75,700}, {0,56,75,600}, {600,65,75,600}, {0,71,100,700}, {600,48,100,700}, {0,56,75,700}, {600,65,75,700}, {0,63,75,700}, {600,55,75,700}, {0,65,75,700}, {600,56,75,700}, {0,62,75,700}, {600,53,75,700}, {0,56,75,700}, {600,65,75,700}, {0,63,75,700}, {600,55,75,700}, {0,56,75,600}, {600,65,75,600}, {0,72,100,700}, {600,48,100,700}, {50,51,75,700}, {600,67,75,700}, {0,65,75,700}, {600,50,75,700}, {0,67,75,700}, {600,51,75,700}, {0,63,75,700}, {600,55,75,700}, {0,67,75,700}, {600,51,75,700}, {0,50,75,700}, {600,65,75,700}, {0,51,75,600}, {600,67,75,600}, {0,72,100,700}, {600,48,100,700}, {0,51,75,700}, {600,67,75,700}, {0,65,75,700}, {600,50,75,700}, {0,51,75,700}, {600,67,75,700}, {0,63,75,700}, {600,55,75,700}, {50,67,75,700}, {600,51,75,700}, {50,50,75,700}, {600,65,75,700}, {0,67,75,600}, {600,51,75,600}, {0,75,100,700}, {600,48,100,700}, {0,68,75,700}, {600,60,75,700}, {0,67,75,700}, {600,58,75,700}, {0,60,75,700}, {600,68,75,700}, {0,63,75,700}, {600,56,75,700}, {0,60,75,700}, {600,68,75,700}, {0,67,75,700}, {600,58,75,700}, {0,68,75,600}, {600,60,75,600}, {0,75,100,700}, {600,48,100,700}, {0,60,75,700}, {600,68,75,700}, {0,67,75,700}, {600,58,75,700}, {0,60,75,700}, {600,68,75,700}, {0,63,75,700}, {600,56,75,700}, {0,60,75,700}, {0,60,25,4800} , {0,72,100,700}, {600,48,100,700}, {0,63,75,700}, {600,55,75,700}, {0,62,75,700}, {600,53,75,700}, {0,63,75,700}, {600,55,75,700}, {0,51,75,700}, {600,60,75,700}, {0,55,75,700}, {600,63,75,700}, {0,62,75,700}, {600,53,75,700}, {0,63,75,600}, {600,55,75,600}, {0,72,100,700}, {600,48,100,700}, {0,55,75,700}, {600,63,75,700}, {0,53,75,700}, {600,62,75,700}, {0,63,75,700}, {600,55,75,700}, {50,60,75,700}, {600,51,75,700}, {0,63,75,700}, {600,55,75,700}, {0,53,75,700}, {600,62,75,700}, {0,63,75,600}, {600,55,75,600}, {0,68,100,700}, {600,48,100,700}, {50,56,75,700}, {600,65,75,700}, {0,55,75,700}, {600,64,75,700}, {50,65,75,700}, {600,56,75,700}, {0,60,75,700}, {600,53,75,700}, {0,65,75,700}, {600,56,75,700}, {0,55,75,700}, {600,64,75,700}, {0,65,75,600}, {600,56,75,600}, {0,48,100,700}, {600,68,100,700}, {0,56,75,700}, {600,65,75,700}, {0,55,75,700}, {600,64,75,700}, {0,65,75,700}, {600,56,75,700}, {0,60,75,700}, {600,53,75,700}, {0,65,75,700}, {600,56,75,700}, {0,64,75,700}, {600,55,75,700}, {50,65,75,600}, {600,56,75,600}, {0,71,100,700}, {600,48,100,700}, {0,56,75,700}, {600,65,75,700}, {0,63,75,700}, {600,55,75,700}, {0,65,75,700}, {600,56,75,700}, {0,62,75,700}, {600,53,75,700}, {0,56,75,700}, {600,65,75,700}, {0,55,75,700}, {600,63,75,700}, {0,56,75,600}, {600,65,75,600}, {0,71,100,700}, {600,48,100,700}, {0,56,75,700}, {600,65,75,700}, {0,63,75,700}, {600,55,75,700}, {0,65,75,700}, {600,56,75,700}, {0,62,75,700}, {600,53,75,700}, {0,56,75,700}, {600,65,75,700}, {0,63,75,700}, {600,55,75,700}, {0,56,75,600}, {600,65,75,600}, {0,72,100,700}, {600,48,100,700}, {50,51,75,700}, {600,67,75,700}, {0,65,75,700}, {600,50,75,700}, {0,67,75,700}, {600,51,75,700}, {0,63,75,700}}
}

dsIndex = 5 // try different index numbers!
events = datasetList[dsIndex]
sclList = {0.6, 1, 1, 1.2, 0.4, 0.2}

dictionary = thin(events) // filter out list repetitions in 'events'
eventsIndex = indexmap(events) // replace lists in events with their index, accounting for repetitions
order = 2 // order of markov model/chain
eventSequence = markov(eventsIndex, order, 750) // build and run markov chain | markov(data, nth_order, iterations)

print(eventSequence)
st = 0
scl = sclList[dsIndex]
for (i = 0; i < len(eventSequence); i += 1) {
    wv = maketable("wave", tblsize, "tri" + trand(2, 13))
    eventIndex = eventSequence[i] // get index of next event
    event = dictionary[eventIndex] // select event from event dictionary
    incr = event[0] / 1000 * scl // event time interval before next note + convert to seconds and scale
    fq = cpsmidi(event[1] + 6) // event pitch + pitch to freq. conversion
    amp = map(event[2], 0, 127, 5000, 9000) // event amplitude
    dur = event[3] / 1000 // event duration + convert to seconds and scale
    env = maketable("curve", "nonorm", tblsize, 0,0,2, 1,1,-1, trand(2, 50),0.5,-2, 200,0)
    WAVETABLE(st, clip(dur, 0.2, 3) * 2, amp * env / 3, fq, random(), wv)
    WAVETABLE(st, clip(dur, 0.2, 3) * 2, amp * env / 3, fq + irand(-1, 1), random(), wv)
    WAVETABLE(st, clip(dur, 0.2, 3) * 2, amp * env / 3, fq + irand(-2, 2), random(), wv)
    st += (incr * irand(0.95, 1.05))
}


