{$I types.pas}
{$I subPrograms.pas}

// main program
var
    a, b, r, s : integer;
    gr : Group;
begin
    {readLn(r, s);
    findAandB(r, s, a, b);
    writeLn(a, b);}
    {read(a);
    printList(getPrimeDecom(a));}

    read(a);
    writeLn(findRootOfPrime(a));
end.

{
    TODO:

    x implement phi
    x create function to dispose a list and a group
    x create function to check if element is in group
    - count elements in getGeneratedSubgroup
    - create findRoot function

}