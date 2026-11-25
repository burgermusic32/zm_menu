#include common_scripts\utility;

main()
{

}

init()
{
    maps\mp\_utility::addcallback( "on_player_connect", ::onplayerconnect );
    maps\mp\_utility::addcallback( "on_player_disconnect", ::onplayerdisconnect );
}

setpoint( point, x, y )
{
    switch( point )
    {
        case "top_right":
            self.alignx = "right";
            self.aligny = "top";
            break;

        default:
            self.alignx = "left";
            self.aligny = "top";
            break;
    }

    self.horzalign = "center";
    self.vertalign = "top";

    self.x = x;
    self.y = y;
}

addoption( title, description, routine, array )
{
    structure = spawnstruct();
    structure.title = title;
    structure.description = description;
    structure.routine = routine;
    structure.array = array;

    self.structure[ self.structure.size ] = structure;
}

addtoggle( title, description, boolean, routine, array )
{
    structure = spawnstruct();
    structure.title = title;
    structure.description = description;
    structure.boolean = boolean;
    structure.routine = routine;
    structure.array = array;

    self.structure[ self.structure.size ] = structure;
}

populatestructure()
{
    self.structure = [];

    if( !self.structure.size )
        self addoption( "Bit Empty, Wouldn't You Say?" );
}

populateinterface()
{
    const limit = 7;
    const scale = 20;

    self populatestructure();

    if( self.cursor > self.structure.size - 1 )
        self.cursor = self.structure.size - 1;

    midpt = int( limit / 2 );
    start = 0;

    if( self.structure.size > limit )
        start = clamp( self.cursor - midpt, 0, self.structure.size - limit );
}

runreference( routine, array )
{
    if( !isdefined( routine ) )
        return;

    if( !isdefined( array ) || !isarray( array ) || !array.size )
        return self [[ routine ]]();

    switch( array.size )
    {
        case 1:
            return self [[ routine ]]( array[ 0 ] );

        default:
            return self [[ routine ]]( array[ 0 ], array[ 1 ] );
    }
}

onplayerconnect()
{

}

onplayerdisconnect()
{

}