func void OREVEIN9_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	
	//**********skill check
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 1)
	{
	monolog = OreVein_09_OM;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	}
	else
	{
	PrintS_Ext("Nie potrafisz wydobywa� surowc�w!", COL_RED);
	};
	//*********skill check end
	
	};
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HeroENdMinning9_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_HeroENdMinning9_EXIT_Condition;
	information		= DIA_PC_HeroENdMinning9_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HeroENdMinning9_EXIT_Condition()
{
    if (monolog == OreVein_09_OM)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_HeroENdMinning9_EXIT_Info()
{
    AI_StopProcessInfos	(self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> LOW_STRIKE9
//========================================
var int dug_ore9;
var int power_strike_progress9;
const int ore_limit9 = 120;
var int all_dug_ore9;

INSTANCE DIA_PC_Hero_LOW_STRIKE9 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LOW_STRIKE9_Condition;
   information  = DIA_PC_Hero_LOW_STRIKE9_Info;
   permanent	= true;
   description	= "(Uderz lekko)";
};

FUNC INT DIA_PC_Hero_LOW_STRIKE9_Condition()
{
    if (monolog == OreVein_09_OM)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_LOW_STRIKE9_Info()
{

if (all_dug_ore9 < ore_limit9)
{
//----losowanie dropa-----------
dug_ore9 = Hlp_Random (4);
if (dug_ore9 == 0)
{
PrintScreen	("Nie uda�o ci si� nic wydoby�!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
power_strike_progress9 = power_strike_progress9 + 4;
};
if (dug_ore9 == 1)
{
PrintScreen	("Wydobywasz 7 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 7);
power_strike_progress9 = power_strike_progress9 +1;
all_dug_ore9 = all_dug_ore9 + 7;
};
if (dug_ore9 == 2)
{
PrintScreen	("Wydobywasz 12 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 12);
power_strike_progress9 = power_strike_progress9 +2;
all_dug_ore9 = all_dug_ore9 + 12;
};
if (dug_ore9 == 3)
{
PrintScreen	("Wydobywasz 20 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 20); 
power_strike_progress9 = power_strike_progress9 +0;
all_dug_ore9 = all_dug_ore9 + 20;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z�o�e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> MID_STRIKE9
//========================================

INSTANCE DIA_PC_Hero_MID_STRIKE9 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_MID_STRIKE9_Condition;
   information  = DIA_PC_Hero_MID_STRIKE9_Info;
   permanent	= true;
   description	= "(Uderz mocno)";
};

FUNC INT DIA_PC_Hero_MID_STRIKE9_Condition()
{
    if (monolog == OreVein_09_OM)
    && (power_strike_progress9 >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MID_STRIKE9_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress9 = 0;

if (all_dug_ore9 < ore_limit9)
{
//-----losowanie dropa
if (dug_ore9 == 0)
{
PrintScreen	("Wydobywasz 12 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 12);
all_dug_ore9 = all_dug_ore9 + 12;
};
if (dug_ore9 == 1)
{
PrintScreen	("Wydobywasz 17 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 17);
all_dug_ore9 = all_dug_ore9 + 17;
};
if (dug_ore9 == 2)
{
PrintScreen	("Wydobywasz 22 bry�ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 22);
all_dug_ore9 = all_dug_ore9 + 22;
};
if (dug_ore9 == 3)
{
PrintScreen	("Wydobywasz 33 bry�ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 33); 
all_dug_ore9 = all_dug_ore9 + 33;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z�o�e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> POWER_STRIKE9
//========================================

INSTANCE DIA_PC_Hero_POWER_STRIKE9 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_POWER_STRIKE9_Condition;
   information  = DIA_PC_Hero_POWER_STRIKE9_Info;
   permanent	= true;
   description	= "(Uderz bardzo mocno)";
};

FUNC INT DIA_PC_Hero_POWER_STRIKE9_Condition()
{
    if (monolog == OreVein_09_OM)
    && (power_strike_progress9 >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_POWER_STRIKE9_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress9 = 0;


dug_ore9 = Hlp_Random (2);
if (all_dug_ore9 < ore_limit9)
{
//-----losowanie dropa
if (dug_ore9 == 0)
{
PrintScreen	("Wydobywasz 42 bry�ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 42);
all_dug_ore9 = all_dug_ore9 + 42;
};
if (dug_ore9 == 1)
{
};
//----losowanie dropa end--------

}
else
{
PrintScreen	("Nie uda�o si�!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
};

};

