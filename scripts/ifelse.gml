/* Syntax: ifelse(condition, ifTrue, ifFalse)

Arguments:
Boolean condition : The condition to check.
Mixed ifTrue, Mixed ifFalse : The values to return if the condition is true or false, respectively.

Returns: iftrue if the condition is true, or ifFalse if the condition is false.

Notes: This is just a shorthand alias since GameMaker has no ternary operator. I'm spoiled.
*/
if (argument0) {
    return argument1;
}
else {
    return argument2;
}
