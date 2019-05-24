func void OREVEIN10_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	
	//**********skill check
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 1)
	{
	monolog = OreVein_010_OM;
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

INSTANCE DIA_PC_HeroENdMinning10_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_HeroENdMinning10_EXIT_Condition;
	information		= DIA_PC_HeroENdMinning10_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HeroENdMinning10_EXIT_Condition()
{
    if (monolog == OreVein_010_OM)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_HeroENdMinning10_EXIT_Info()
{
    AI_StopProcessInfos	(self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> LOW_STRIKE10
//========================================
var int dug_ore10;
var int power_strike_progress10;
const int ore_limit10 = 120;
var int all_dug_ore10;

INSTANCE DIA_PC_Hero_LOW_STRIKE10 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LOW_STRIKE10_Condition;
   information  = DIA_PC_Hero_LOW_STRIKE10_Info;
   permanent	= true;
   description	= "(Uderz lekko)";
};

FUNC INT DIA_PC_Hero_LOW_STRIKE10_Condition()
{
    if (monolog == OreVein_010_OM)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_LOW_STRIKE10_Info()
{

if (all_dug_ore10 < ore_limit10)
{
//----losowanie dropa-----------
dug_ore10 = Hlp_Random (4);
if (dug_ore10 == 0)
{
PrintScreen	("Nie uda�o ci si� nic wydoby�!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
power_strike_progress10 = power_strike_progress10 + 4;
};
if (dug_ore10 == 1)
{
PrintScreen	("Wydobywasz 7 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 7);
power_strike_progress10 = power_strike_progress10 +1;
all_dug_ore10 = all_dug_ore10 + 7;
};
if (dug_ore10 == 2)
{
PrintScreen	("Wydobywasz 12 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 12);
power_strike_progress10 = power_strike_progress10 +2;
all_dug_ore10 = all_dug_ore10 + 12;
};
if (dug_ore10 == 3)
{
PrintScreen	("Wydobywasz 20 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 20); 
power_strike_progress10 = power_strike_progress10 +0;
all_dug_ore10 = all_dug_ore10 + 20;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z�o�e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> MID_STRIKE10
//========================================

INSTANCE DIA_PC_Hero_MID_STRIKE10 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_MID_STRIKE10_Condition;
   information  = DIA_PC_Hero_MID_STRIKE10_Info;
   permanent	= true;
   description	= "(Uderz mocno)";
};

FUNC INT DIA_PC_Hero_MID_STRIKE10_Condition()
{
    if (monolog == OreVein_010_OM)
    && (power_strike_progress10 >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MID_STRIKE10_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress10 = 0;

if (all_dug_ore10 < ore_limit10)
{
//-----losowanie dropa
if (dug_ore10 == 0)
{
PrintScreen	("Wydobywasz 12 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 12);
all_dug_ore10 = all_dug_ore10 + 12;
};
if (dug_ore10 == 1)
{
PrintScreen	("Wydobywasz 17 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 17);
all_dug_ore10 = all_dug_ore10 + 17;
};
if (dug_ore10 == 2)
{
PrintScreen	("Wydobywasz 22 bry�ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 22);
all_dug_ore10 = all_dug_ore10 + 22;
};
if (dug_ore10 == 3)
{
PrintScreen	("Wydobywasz 33 bry�ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 33); 
all_dug_ore10 = all_dug_ore10 + 33;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z�o�e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> POWER_STRIKE10
//========================================

INSTANCE DIA_PC_Hero_POWER_STRIKE10 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_POWER_STRIKE10_Condition;
   information  = DIA_PC_Hero_POWER_STRIKE10_Info;
   permanent	= true;
   description	= "(Uderz bardzo mocno)";
};

FUNC INT DIA_PC_Hero_POWER_STRIKE10_Condition()
{
    if (monolog == OreVein_010_OM)
    && (power_strike_progress10 >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_POWER_STRIKE10_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress10 = 0;


dug_ore10 = Hlp_Random (2);
if (all_dug_ore10 < ore_limit10)
{
//-----losowanie dropa
if (dug_ore10 == 0)
{
PrintScreen	("Wydobywasz 42 bry�ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 42);
all_dug_ore10 = all_dug_ore10 + 42;
};
if (dug_ore10 == 1)
{
};
//----losowanie dropa end--------

}
else
{
PrintScreen	("Nie uda�o si�!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
};

};

