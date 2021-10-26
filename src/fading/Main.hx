package fading;

// kha 86d3e4d6cf1ce926927ecb61d8075f9928d5f809
// haxeui core 941ff025aa403e2e7f6086030a67d602c07e8028
// haxeui kha  f3e9282f775f82dfa0da1c8f21c893e2ecf094ca - doesn't exist anymore, but seems to be identical to the one below
// 			6b1c565ad8ad6f8c79e23dee83ebcb5affa8ec0f

@:xml('
<vbox styleNames="wh-100">
	<style>
		.wh-100 {
			width: 100%;
			height: 100%;
		}

		.thingy {
			background-color: #fff;
			opacity: 0;
		}

		.thingy:appear {
			animation: animate_fade_in 0.5s ease 0s 1;
		}

		.thingy:disappear {
			animation: animate_fade_out 0.5s ease 0s 1;
		}

		@keyframes animate_fade_in {
			0% {
				opacity: 0;
			}
			100% {
				opacity: 1;
			}
		}

		@keyframes animate_fade_out {
			0% {
				opacity: 1;
			}
			100% {
				opacity: 0;
			}
		}
	</style>

	<label id="thingy" text="thingy" styleNames="thingy wh-25" tooltip="the thing!" />

	<button id="toggle" text="toggle" />
</vbox>'
)
private class View extends VBox {
	var old_state = ':disappear';
	var new_state = ':appear';

	public function new() {
		super();

		toggle.onClick = function( _ ) {
			final tmp = old_state;
			old_state = new_state;
			new_state = tmp;
			thingy.swapClass(old_state, new_state);
			toggle.text = new_state;
		}

		toggle.text = new_state;
	}
}


// @:xml('
// <vbox styleNames="wh-100">
// 	<style>
// 		.wh-100 {
// 			width: 100%;
// 			height: 100%;
// 		}
// 	</style>

// 	<accordion styleNames="wh-100">
// 	<vbox text="Page 1" width="100%">
// 	<button text="Button 1" width="100%" height="20%" />
// 	<button text="Button 2" width="100%" height="20%" />
// 	<button text="Button 3" width="100%" height="20%" />
// 	<button text="Button 4" width="100%" height="20%" />
// 	<button text="Button 5" width="100%" height="20%" />
// </vbox>
// <vbox id="page2" text="Page 2" width="100%" style="padding: 0px;">
// 	<scrollview width="100%" height="100%" contentWidth="100%">
// 		<button text="Button 1" width="100%" />
// 		<button text="Button 2" width="100%" />
// 		<button text="Button 3" width="100%" />
// 		<button text="Button 4" width="100%" />
// 		<button text="Button 5" width="100%" />
// 		<button text="Button 6" width="100%" />
// 		<button text="Button 7" width="100%" />
// 		<button text="Button 8" width="100%" />
// 		<button text="Button 9" width="100%" />
// 		<button text="Button 10" width="100%" />
// 		<button text="Button 11" width="100%" />
// 		<button text="Button 12" width="100%" />
// 		<button text="Button 13" width="100%" />
// 		<button text="Button 14" width="100%" />
// 		<button text="Button 15" width="100%" />
// 		<button text="Button 16" width="100%" />
// 		<button text="Button 18" width="100%" />
// 		<button text="Button 19" width="100%" />
// 		<button text="Button 20" width="100%" />
// 	</scrollview>
// </vbox>
// <vbox text="Page 3" width="100%">
// 	<button text="Button 1" width="100%" height="20%" />
// 	<button text="Button 2" width="100%" height="20%" />
// 	<button text="Button 3" width="100%" height="20%" />
// 	<button text="Button 4" width="100%" height="20%" />
// 	<button text="Button 5" width="100%" height="20%" />
// </vbox>
// <vbox text="Page 4" width="100%" style="padding: 0;padding-bottom: 1px;">
// 	<listview width="100%" height="100%">
// 		<data>
// 			<item value="Item 1" />
// 			<item value="Item 2" />
// 			<item value="Item 3" />
// 			<item value="Item 4" />
// 			<item value="Item 5" />
// 			<item value="Item 6" />
// 			<item value="Item 7" />
// 			<item value="Item 8" />
// 			<item value="Item 9" />
// 			<item value="Item 10" />
// 			<item value="Item 11" />
// 			<item value="Item 12" />
// 			<item value="Item 13" />
// 			<item value="Item 14" />
// 			<item value="Item 15" />
// 			<item value="Item 16" />
// 			<item value="Item 17" />
// 			<item value="Item 18" />
// 			<item value="Item 19" />
// 			<item value="Item 20" />
// 		</data>
// 	</listview>
// </vbox>
// <vbox text="Page 5" width="100%" style="padding: 0;padding-bottom: 1px;">
// 	<tableview width="100%" height="100%">
// 		<header>
// 			<column id="colA" text="Col A" width="70" />
// 			<column id="colB" text="Col B" width="70" />
// 			<column id="colC" text="Col C" width="100" />
// 		</header>
// 		<data>
// 			<item colA="Item 1A" colB="Item 1B" colC="Item 1C" />
// 			<item colA="Item 2A" colB="Item 2B" colC="Item 2C" />
// 			<item colA="Item 3A" colB="Item 3B" colC="Item 3C" />
// 			<item colA="Item 4A" colB="Item 4B" colC="Item 4C" />
// 			<item colA="Item 5A" colB="Item 5B" colC="Item 5C" />
// 			<item colA="Item 6A" colB="Item 6B" colC="Item 6C" />
// 			<item colA="Item 7A" colB="Item 7B" colC="Item 7C" />
// 			<item colA="Item 8A" colB="Item 8B" colC="Item 8C" />
// 			<item colA="Item 9A" colB="Item 9B" colC="Item 9C" />
// 			<item colA="Item 10A" colB="Item 10B" colC="Item 10C" />
// 			<item colA="Item 11A" colB="Item 11B" colC="Item 11C" />
// 			<item colA="Item 12A" colB="Item 12B" colC="Item 12C" />
// 			<item colA="Item 13A" colB="Item 13B" colC="Item 13C" />
// 			<item colA="Item 14A" colB="Item 14B" colC="Item 14C" />
// 			<item colA="Item 15A" colB="Item 15B" colC="Item 15C" />
// 			<item colA="Item 16A" colB="Item 16B" colC="Item 16C" />
// 			<item colA="Item 17A" colB="Item 17B" colC="Item 17C" />
// 			<item colA="Item 18A" colB="Item 18B" colC="Item 18C" />
// 			<item colA="Item 19A" colB="Item 19B" colC="Item 19C" />
// 			<item colA="Item 20A" colB="Item 20B" colC="Item 20C" />
// 		</data>
// 	</tableview>
// </vbox>
// 	</accordion>
// </vbox>'
// )
// private class View extends VBox {
// 	var old_state = ':appear';
// 	var new_state = ':disappear';

// 	public function new() {
// 		super();

// 		// toggle.onClick = function( _ ) {
// 		// 	final tmp = old_state;
// 		// 	old_state = new_state;
// 		// 	new_state = tmp;
// 		// 	thingy.swapClass(old_state, new_state);
// 		// 	toggle.text = new_state;
// 		// }

// 		// toggle.text = new_state;
// 	}
// }

class Main {
	public static function main() {
		kha.System.start({ title: 'sample' }, function( _ ) {
			kha.Assets.loadEverything(function() {
				haxe.ui.Toolkit.theme = 'dark';
				haxe.ui.Toolkit.init({});
				haxe.ui.core.Screen.instance.options.noBatch = true;
				haxe.ui.core.Screen.instance.addComponent(new View());

				kha.System.notifyOnFrames(function( fbs ) {
					final fb = fbs[0];
					final g2 = fb.g2;

					g2.begin(true, 0xff004040);
						haxe.ui.core.Screen.instance.renderTo(g2);
					g2.end();
				});
			});
		});
	}
}
