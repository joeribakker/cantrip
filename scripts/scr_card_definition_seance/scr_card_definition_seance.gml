function scr_card_definition_seance(card) {
	card.name = "seance";
	card.title = "seance";
	card.cost = 1;
	card.text = "Play the top card from your graveyard.";
	card.effect = do_seance_effect;
	card.condition = can_play_seance;
	card.rarity = 2;
	card.has_priority = check_priority_for_seance;
}

function do_seance_effect(target, source, card) {
	var card_to_play = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);

	if (!card_to_play) {
		return;
	}
	
	scr_remove_item_from_list(source.graveyard, card_to_play);
	with (card_to_play) {
		played_by = source;
		state_switch("startPlay");
	}
	
	scr_add_event_log(source.name + " communes with the spirits and plays " + card_to_play.title + " from beyond the veil.");
}

function can_play_seance(target, source) {
	if (ds_list_size(source.graveyard) == 0) {
		return false;
	}
	
	var card_to_play = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);
	
	if (card_to_play.name == "seance") {
		return false;
	}
	
	if (card_to_play.is_unplayable) {
		return false;
	}
	
	return true;
}

function check_priority_for_seance(target, source, playable_cards, unplayable_cards, card) {
	if (ds_list_size(target.graveyard) == 0) {
		return false;
	}

	var card_to_play = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);
	
	if (card_to_play.name == "revenge_from_beyond" || card_to_play.name == "seance") {
		return false;
	}
	
	if (is_undefined(card_to_play.has_priority)) {
		return false;
	}
	
	return card_to_play.has_priority(target, source, playable_cards, unplayable_cards, card_to_play);
}