extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
	if event == "card_hit" and params[0] == card and isFriendly:
				
		fightManager.draw_card(CardInfo.from_name("Worker Ant"))
