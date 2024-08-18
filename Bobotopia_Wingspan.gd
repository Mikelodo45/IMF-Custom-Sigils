extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
		# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card:
				
		var friendlies = slotManager.all_friendly_cards() if isFriendly else slotManager.all_enemy_cards()
		
		for fCard in friendlies:
			if fCard == card:
				continue
		
			if "sigils" in fCard.card_data and "Airborne" in fCard.card_data.sigils:
				var new_data = fCard.card_data.duplicate()
		
				new_data.attack += 1
				new_data.health += 1
		
				fCard.from_data(new_data)