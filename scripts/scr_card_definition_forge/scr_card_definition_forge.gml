function scr_card_definition_forge(card) {
	card.name = "forge";
	card.title = "forge";
	card.cost = 2;
	card.text = "increase damage of all your \"attack\" cards by 1.";
	card.effect = do_forge_effect;
	card.rarity = 1;
	card.has_priority = check_priority_for_forge;
	card.highlight = forge_highlight;
}

function do_forge_effect(target, source) {
	with (obj_card_base) {
		var card = self.id;
		
		if (
			card.owner == source
			&& card.name == "attack"
		) {
			card.damage += 1;
			card.text = "Do " + string(card.damage) + " damage.";
		}
	}
	
	scr_add_event_log(source.name + "'s attacks become more powerful.");
}

function check_priority_for_forge(target, source) {
	var amount_of_cards = 0;
	
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card_to_check = ds_list_find_value(source.hand, c);
	
		if (card_to_check.name == "attack") {
			amount_of_cards += 1;
		}
	}
	
	if (amount_of_cards >= 1) {
		return true;
	}

	return false;
}

function forge_highlight(target, source) {
	var highlighted_cards = ds_list_create();
	
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "attack") {
			ds_list_add(highlighted_cards, card);
		}
	}

	return highlighted_cards;
}