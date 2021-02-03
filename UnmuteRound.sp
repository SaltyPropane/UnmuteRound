#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Salty"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <basecomm>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "UnmuteRound",
	author = PLUGIN_AUTHOR,
	description = "Unmutes CT's at beginning of each round daddy.",
	version = PLUGIN_VERSION,
	url = ""
};



public void OnPluginStart()
{
    HookEvent("round_start", Event_OnRoundStart);
}



public void Event_OnRoundStart(Event event, const char[] name, bool dontBroadcast)
{
    for(int i = 1; i<= MaxClients; i++)
    {
        if (IsClientInGame(i) && GetClientTeam(i) == CS_TEAM_CT)
        {

            BaseComm_SetClientMute(i , true);
            BaseComm_SetClientMute(i , false);
        }
    }
    //PrintToChatAll(" \x02[AUTO SM] \x01CT's Have been muted.");
    PrintToChatAll(" \x02[AUTO SM] \x01CT's Have been unmuted.");
}