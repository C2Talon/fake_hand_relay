//fake hand relay
//c2t


void main() {
	buffer page = visit_url();
	int num = 0;
	string fakeHandFull = `<tr><td width=30 height=30><img src="https://d2uyhvukfffg5a.cloudfront.net/itemimages/glove.gif" class=hand onClick='descitem\\([\\d\\s,]+\\)'></td><td valign=center><b>fake hand</b></td></tr>`;
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
