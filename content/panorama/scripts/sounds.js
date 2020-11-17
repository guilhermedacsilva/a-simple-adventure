"use strict";

function EmitClientSound(table)
{
	$.Msg(table)
    if (table["sound"]){
        Game.EmitSound(table["sound"]); 
    }
}

(function(){
    GameEvents.Subscribe( "emit_client_sound", EmitClientSound);
})()