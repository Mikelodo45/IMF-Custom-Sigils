extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card:
		if isFriendly:
			fightManager.max_energy_buff += 1
			fightManager.set_max_energy(fightManager.max_energy)
			fightManager.set_energy(fightManager.energy + 1)
		else:
			fightManager.opponent_max_energy_buff += 1
			fightManager.set_opponent_max_energy(fightManager.opponent_max_energy)
			fightManager.set_opponent_energy(fightManager.opponent_energy + 1)