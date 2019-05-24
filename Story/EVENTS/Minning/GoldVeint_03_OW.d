func void GOLDVEIN3_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	
	//**********skill check
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 1)
	{
	monolog = GoldVein_03_OW;
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

INSTANCE DIA_PC_HeroENdMinningGold3_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_HeroENdMinningGold3_EXIT_Condition;
	information		= DIA_PC_HeroENdMinningGold3_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HeroENdMinningGold3_EXIT_Condition()
{
    if (monolog == GoldVein_03_OW)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_HeroENdMinningGold3_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LOW_STRIKE_GOLD3
//========================================
var int dug_Gold3;
var int power_goldstrike_progress3;
const int Gold_limit3 = 33;
var int all_dug_Gold3;

INSTANCE DIA_PC_Hero_LOW_STRIKE_GOLD3 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LOW_STRIKE_GOLD3_Condition;
   information  = DIA_PC_Hero_LOW_STRIKE_GOLD3_Info;
   permanent	= true;
   description	= "(Uderz lekko)";
};

FUNC INT DIA_PC_Hero_LOW_STRIKE_GOLD3_Condition()
{
    if (monolog == GoldVein_03_OW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_LOW_STRIKE_GOLD3_Info()
{

if (all_dug_Gold3 < Gold_limit3)
{
//----losowanie dropa-----------
dug_Gold3 = Hlp_Random (4);
if (dug_Gold3 == 0)
{
PrintScreen	("Nie uda�o ci si� nic wydoby�!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
power_goldstrike_progress3 = power_goldstrike_progress3 + 4;
};
if (dug_Gold3 == 1)
{
PrintScreen	("Wydobywasz 7 bry�ek z�ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 7);
power_goldstrike_progress3 = power_goldstrike_progress3 +1;
all_dug_Gold3 = all_dug_Gold3 + 7;
};
if (dug_Gold3 == 2)
{
PrintScreen	("Wydobywasz 12 bry�ek z�ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 12);
power_goldstrike_progress3 = power_goldstrike_progress3 +2;
all_dug_Gold3 = all_dug_Gold3 + 12;
};
if (dug_Gold3 == 3)
{
PrintScreen	("Wydobywasz 20 bry�ek z�ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 20); 
power_goldstrike_progress3 = power_goldstrike_progress3 +0;
all_dug_Gold3 = all_dug_Gold3 + 20;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z�o�e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> MID_STRIKE_GOLD3
//========================================

INSTANCE DIA_PC_Hero_MID_STRIKE_GOLD3 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_MID_STRIKE_GOLD3_Condition;
   information  = DIA_PC_Hero_MID_STRIKE_GOLD3_Info;
   permanent	= true;
   description	= "(Uderz mocno)";
};

FUNC INT DIA_PC_Hero_MID_STRIKE_GOLD3_Condition()
{
    if (monolog == GoldVein_03_OW)
    && (power_goldstrike_progress3 >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MID_STRIKE_GOLD3_Info()
{
//zerowanie progresu na mocne uderzenie
power_goldstrike_progress3 = 0;

if (all_dug_Gold3 < Gold_limit3)
{
//-----losowanie dropa
if (dug_Gold3 == 0)
{
PrintScreen	("Wydobywasz 12 bry�ek z�ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 12);
all_dug_Gold3 = all_dug_Gold3 + 12;
};
if (dug_Gold3 == 1)
{
PrintScreen	("Wydobywasz 17 bry�ek z�ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 17);
all_dug_Gold3 = all_dug_Gold3 + 17;
};
if (dug_Gold3 == 2)
{
PrintScreen	("Wydobywasz 22 bry�ki z�ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 22);
all_dug_Gold3 = all_dug_Gold3 + 22;
};
if (dug_Gold3 == 3)
{
PrintScreen	("Wydobywasz 33 bry�ki z�ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 33); 
all_dug_Gold3 = all_dug_Gold3 + 33;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z�o�e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> POWER_STRIKE_GOLD3
//========================================

INSTANCE DIA_PC_Hero_POWER_STRIKE_GOLD3 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_POWER_STRIKE_GOLD3_Condition;
   information  = DIA_PC_Hero_POWER_STRIKE_GOLD3_Info;
   permanent	= true;
   description	= "(Uderz bardzo mocno)";
};

FUNC INT DIA_PC_Hero_POWER_STRIKE_GOLD3_Condition()
{
    if (monolog == GoldVein_03_OW)
    && (power_goldstrike_progress3 >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_POWER_STRIKE_GOLD3_Info()
{
//zerowanie progresu na mocne uderzenie
power_goldstrike_progress3 = 0;


dug_Gold3 = Hlp_Random (2);
if (all_dug_Gold3 < Gold_limit3)
{
//-----losowanie dropa
if (dug_Gold3 == 0)
{
PrintScreen	("Wydobywasz 42 bry�ki z�ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 42);
all_dug_Gold3 = all_dug_Gold3 + 42;
};
if (dug_Gold3 == 1)
{
};
//----losowanie dropa end--------

}
else
{
PrintScreen	("Nie uda�o si�!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
};

};

