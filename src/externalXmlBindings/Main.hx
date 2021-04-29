package externalXmlBindings;

// @:xml('
// <hbox>
// 	<button id="b1" text="b1" />
// 	<button id="b2" text="b2" />
// </hbox>
// ')
@:build(haxe.ui.macros.ComponentMacros.build('externalXmlBindings/View.xml'))
private class View extends HBox {
	public function new() {
		super();
	}

	// This will behave weird.

		// If you click on `+` first, it will append a 1 every time you click it instead of incrementing `counter`.

		// If you click on `-` first, it will correctly decrement and display `-1`,
		// and if you then click `+` it will correctly increment and display the counter.

	@:bind(counterValue.text) var counter: Int = 0;

	@:bind(dec, MouseEvent.CLICK) function onDec( event ) {
		counter -= 1;
	}

	@:bind(inc, MouseEvent.CLICK) function onInc( event ) {
		counter += 1;
	}
}

class Main {
	public static function main() {
		kha.System.start({}, function( _ ) {
			kha.Assets.loadEverything(function() {
				haxe.ui.Toolkit.init();
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
