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

    read(a, b, r);
    gr := getGeneratedG(a, b);
    printGroup(gr);
    writeLn(containsElement(r,gr));
end.

{
    TODO:

    x implement phi
    x create function to dispose a list and a group
    x create function to check if element is in group
    - create findRoot function

}