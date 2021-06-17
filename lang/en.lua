-- Binding names
ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_CUSTOM_JOURNAL", "Custom Quest Journal")
ZO_CreateStringId("SI_BINDING_NAME_LCQ_INTERACT", "Interaction Key")
ZO_CreateStringId("SI_BINDING_NAME_LCQ_DBG", "LCQ: Debug Key")

-- Journal
ZO_CreateStringId("LCQ_MAIN_MENU_CUSTOM_JOURNAL", "Journal II")
ZO_CreateStringId("LCQ_JOURNAL_CUSTOM_QUEST_MENU_HEADER", "Custom Quests")
ZO_CreateStringId("LCQ_QUESTS_CURRENT", "Quests: |cffffff<<1>>|r")

if not LCQ then LCQ = {} end
if not LCQ.bgControl then 
    LCQ.bgControl = CreateControlFromVirtual("LibCustomQuestBackground", nil, "ALCI_SharedRightBackground") 
end