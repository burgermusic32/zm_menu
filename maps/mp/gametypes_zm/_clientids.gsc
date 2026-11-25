#include common_scripts\utility;

main()
{

}

init()
{
    maps\mp\_utility::addcallback( "on_player_connect", ::onplayerconnect );
    maps\mp\_utility::addcallback( "on_player_disconnect", ::onplayerdisconnect );
}

onplayerconnect()
{

}

onplayerdisconnect()
{

}