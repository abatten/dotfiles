if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    tmux attach-session -t ozstar || tmux new-session -s ozstar
fi

module purge
module load anaconda3/5.0.1

source activate py3

module load gcc/7.3.0
module load git/2.16.0
module load openmpi/3.0.0
module load hdf5/1.10.1

#module list
