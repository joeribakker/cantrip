function scr_card_definition_rage(card) {
	card.name = "rage";
	card.title = "rage";
	card.cost = 2;
	card.damage = 1;
	card.text = get_rage_text(card.damage);
	card.effect = do_rage_effect;
	card.rarity = 3;
	card.has_priority = check_priority_for_rage;
}

function do_rage_effect(target, source, card) {
	scr_take_damage(target, card.damage, source);
	card.damage += 1;
	card.text = get_rage_text(card.damage);
	
	scr_add_event_log(source.name + " attacks " + target.name + " in a fit of ever increasing rage.");
}

function get_rage_text(damage) {
	return "Do " + string(damage) + " damage. When played, increase damage by 1.";
}

function check_priority_for_rage() {
	return true;
}