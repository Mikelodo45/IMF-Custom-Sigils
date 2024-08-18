extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card:
		
		var friendlies = slotManager.all_friendly_cards() if isFriendly else slotManager.all_enemy_cards()
		var targetCard = slotManager.get_friendly_card(card.slot_idx()+1) if isFriendly else slotManager.get_enemy_card(card.slot_idx()+1)		

		if not targetCard: return
		var new_data = targetCard.card_data.duplicate(true)
		new_data.attack += 1
		new_data.health += 1
		targetCard.from_data(new_data)