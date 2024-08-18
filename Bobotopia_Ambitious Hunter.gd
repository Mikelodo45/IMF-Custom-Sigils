extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card:
		if slotManager.is_slot_empty(slotManager.enemySlots[card.slot_idx()]) and isFriendly:
			slotManager.summon_card(CardInfo.from_name("Big Prey"), card.slot_idx(), false)
		elif slotManager.is_slot_empty(slotManager.playerSlots[card.slot_idx()]):
			slotManager.summon_card(CardInfo.from_name("Big Prey"), card.slot_idx(), true)
		else:
			var new_data = card.card_data.duplicate(true)
			new_data.attack -= 1
			new_data.health -= 1
			card.from_data(new_data)