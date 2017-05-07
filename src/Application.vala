/*
* Copyright (c) 2017 APP Developers (http://github.com/alons45/quotes)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Author <alons45@gmail.com>
*/

// valac --thread --pkg libsoup-2.4 --pkg json-glib-1.0 --pkg gtk+-3.0 Application.vala ui/MainWindow.vala -o ~/Workspace/Desktop/quotes/build/quote

public class Application : Gtk.Application {

	public Soup.Session session { get; private set; }

	public unowned string quote_host {
		get {
			return "http://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en";
		}
	}
	public Application () {
		Object (
			application_id: "com.github.alons45.quotes",
			flags: ApplicationFlags.FLAGS_NONE
		);

		this.session = new Soup.Session ();
	}

	protected override void activate () {
		new MainWindow (this);
	}

	public static int main(string[] args) {
		return new Application ().run (args);
	}
}
