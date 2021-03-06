function scr_card_definition_healing_potion(card) {
	card.name = "healing_potion";
	card.title = "healing potion";
	card.cost = 2;
	card.text = "Draw 3 cards.";
	card.effect = do_healing_potion_effect;
	card.condition = can_play_healing_potion;
	card.rarity = 1;
	card.has_priority = check_priority_for_healing_potion;
}

function do_healing_potion_effect(target, source) {
	scr_draw_cards(source, 3);
	scr_add_event_log(source.name + " takes a swig of a verdant, swirling potion. They feel revitalized.");
}

function can_play_healing_potion(target, source) {
	return ds_list_size(source.draw_pile) > 0 || ds_list_size(source.graveyard) > 0;
}

function check_priority_for_healing_potion(target, source, playable_cards, unplayable_cards, card) {
	var space_in_hand = source.max_hand_size - ds_list_size(source.hand);
	
	if (space_in_hand >= 2) {
		return true;
	}
	
	return false;
}