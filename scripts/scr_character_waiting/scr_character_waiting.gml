function scr_character_waiting() {
	if (!ds_queue_empty(cards_to_discard)) {
		state_switch("discardingCards");
		exit;
	}


	if (amount_of_cards_to_draw > 0) {
		state_switch("drawingCards");
		exit;
	}

	if (damage_to_take > 0) {
		state_switch("takingDamage");
		exit;
	}


}
