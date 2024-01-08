//fake hand relay -- inventory
//c2t


void main() {
	buffer page = visit_url();
	int num = 0;
	string fakeHandFull = `<tr><td[^>]*><a[^>]*>Off-Hand</a>:</td><td><img[^>]*></td><td><b>fake hand</b>\\s+<a[^>]*><font[^>]*>\\[unequip\\]</font></a></td></tr>`;
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
