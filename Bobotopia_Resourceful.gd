extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
		# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card and isFriendly:
				
		fightManager.draw_card(fightManager.deck.pop_front(), fightManager.get_node("DrawPiles/YourDecks/Deck"))
