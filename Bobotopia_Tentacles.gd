extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card:
		var friendlySlots = slotManager.playerSlots if isFriendly else slotManager.enemySlots
		if card.slot_idx() > 0 and slotManager.is_slot_empty(friendlySlots[card.slot_idx()-1]):
			slotManager.summon_card(CardInfo.from_name("Tentacle"), (card.slot_idx()-1), isFriendly)
		if card.slot_idx() < 3 and slotManager.is_slot_empty(friendlySlots[card.slot_idx()+1]):
			slotManager.summon_card(CardInfo.from_name("Tentacle"), (card.slot_idx()+1), isFriendly)