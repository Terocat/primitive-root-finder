{$I types.pas}
{$I subPrograms.pas}

// main program
var
    a, b, r, s : integer;
begin
    {readLn(r, s);
    findAandB(r, s, a, b);
    writeLn(a, b);}
    {read(a);
    printList(getPrimeDecom(a));}

    read(a, b, r);
    writeLn(modularPower(a,b, r));
end.