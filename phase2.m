function [message, index, T] = phase2(index, T, artificialIndex)
    [index, T] = removeArtificialLines(index, T, artificialIndex);
    [message, index, T] = phase1(index, T);
end