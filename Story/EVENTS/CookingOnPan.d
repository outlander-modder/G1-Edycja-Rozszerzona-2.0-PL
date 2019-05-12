
func void cookpan_s1()
{
	var C_Npc her;
	var C_Npc rock;
	var int smazone_mieso;
	var int ilosc_miesa;
	var string napis_mieso;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
		{
			ilosc_miesa = Npc_HasItems(hero,ItFoMuttonRaw);
			if(ilosc_miesa > 0)
			{
				Npc_RemoveInvItems(hero,ItFoMuttonRaw,ilosc_miesa);
				CreateInvItems(hero,ItFoMutton,ilosc_miesa);
				napis_mieso = ConcatStrings(IntToString(ilosc_miesa)," sztuk miêsa usma¿ono.");
				PrintScreen(napis_mieso,-1,70,"font_old_20_white.tga",3);
			};
		};
	};
};

