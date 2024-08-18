extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
		# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and not card.in_hand and not params[0].card_data.rare:
		
		if (params[0] in slotManager.all_friendly_cards() and isFriendly) or not (params[0] in slotManager.all_friendly_cards() or isFriendly):
			var new_data = params[0].card_data.duplicate(true)
			card.from_data(new_data)