instance VLK_581_Snaf (Npc_Default)
{
	//-------- primary data --------
	name =							"Snaf";
	npctype =						npctype_Main;
	guild =							GIL_VLK;
	level =							5;
	
	
	voice =							1;
	id =							581;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Hum_Body_CookSmith", 	0, 			1,			"Hum_Head_Fighter", 81, 		1, 			-1);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,2);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente -------- 
	Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);		
	Npc_SetTalentSkill	(self,NPC_TALENT_SNEAK,	1);			
			
	
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_Light_01);
	CreateInvItem	(self, ItMi_Stuff_Cup_01);
	
	CreateInvItem	(self, ITWR_RECIPTE_SCABROTH);
	CreateInvItem	(self, ITWR_RECIPTE_MUSHROOMSSOUP);
	CreateInvItem	(self, ITWR_RECIPTE_MOLERATSOUP);
	CreateInvItem	(self, ITWR_RECIPTE_WURZELSUPPE);
	CreateInvItems	(self, ItFo_wineberrys_01,3);
	CreateInvItems	(self, ItFoLoaf,5);
	CreateInvItems	(self, ItFoMutton,15);
	CreateInvItems	(self, ItFoRice,22);
	
	CreateInvItems	(self, ITMI_ALCHEMY_ZUCKER_01,17);
	CreateInvItems	(self, ItMi_Alchemy_Salt_01,24);
	CreateInvItems	(self, ItMi_Alchemy_Moleratlubric_01,2);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_581;
};

FUNC VOID Rtn_start_581 ()
{
    TA_Cook		(08,00,22,00,"OCR_CAULDRON_2");
	TA_Sleep	(22,00,08,00,"OCR_HUT_14");
};


