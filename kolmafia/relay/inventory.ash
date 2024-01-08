//fake hand relay -- inventory
//c2t


void main() {
	buffer page = visit_url();
	int num = 0;
	string fakeHandFull = `<tr><td align=right valign=center><a class=nounder href="#Off-Hand">Off-Hand</a>:</td><td><img src="[^"]*" class=hand onClick='descitem\\(826737671,0, event\\);'></td><td><b>fake hand</b>  <a href="inv_equip.php\\?pwd={my_hash()}&which=2&action=unequip&type=fakehand"><font size=1>\\[unequip\\]</font></a></td></tr><tr>`;
	string fakeHandPart = "<b>fake hand</b>";

	matcher m = create_matcher(fakeHandPart,page);

	while (m.find())
		num++;

	if (num == 0) {
		write(page);
		return;
	}

	m = create_matcher(fakeHandPart,page);
	page = replace_first(m,`<b>fake hand ({num})</b>`).to_buffer();
	m = create_matcher(fakeHandFull,page);
	page = replace_all(m,"").to_buffer();

	write(page);
}
