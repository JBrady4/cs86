# NAMD control script
# Date: Jan-16-2013  18:56, machine: ararat.cs.dartmouth.edu, directory:

# -- structure parameters
structure 1ubq_m1_autopsf.psf  # PSF file
coordinates 1ubq-lastframe # PDB file with starting coordinates

# -- variables parameters
set temperature 298.15;             # simulation temperature in Kelvin
set outname traj2; # base name for output files

# -- forcefield parameters
paraTypeCharmm on
parameters par_all36_prot.prm
exclude scaled1-4
1-4scaling 1
cutoff 12
switching on
switchdist 10
pairlistdist 13.5

# -- initialization parameters
temperature $temperature

# -- integrator parameters
timestep 1;       # integration time step in fs
rigidBonds all;     # needs to be 'all' for 2 fs/step
nonbondedFreq 1
fullElectFrequency 1
stepspercycle 10

# -- simulation parameters
langevin on;               # do Langevin dynamics?
langevinDamping 5;         # damping coefficient (gamma), e.g. 5/ps
langevinTemp $temperature
langevinHydrogen off;      # couple Langevin bath to hydrogens?

# -- io parameters
outputName $outname
outputEnergies 100 # how frequently to output energies to standard out
dcdfreq 100        # how frequently to write snapshots to the .dcd trajectory

#-- COMMANDS
# pre-minimization (make sure initial structure does not cause dynamic instabilities)
minimize 1000
# length of the dynamics simulation
run 1000000
