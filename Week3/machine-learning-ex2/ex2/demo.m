for i = 1:6
    for j = 0:i
        s = strcat('X1^',int2str(i-j),'X2^',int2str(j));
        display(s);
    end
end
