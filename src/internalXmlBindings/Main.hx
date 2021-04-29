package internalXmlBindings;

@:xml('
<hbox>
	<button id="dec" text="-" />
	<label id="counterValue" text="0" style="font-size: 24px; color: #fff;" />
	<button id="inc" text="+" />
</hbox>
')
private class View extends HBox {
	public function new() {
		super();
	}

	// This won't work at all and only log some errors at startup.
		// haxe/ui/core/Screen.hx:146: WARNING: Screen event "keydown" not supported
		// haxe/ui/macros/Macros.hx:274: WARNING: could not find component to regsiter event (inc)
		// haxe/ui/macros/Macros.hx:274: WARNING: could not find component to regsiter event (dec)
		// haxe/ui/macros/Macros.hx:194: WARNING: no child component found: counterValue
		// haxe/ui/macros/Macros.hx:211: WARNING: no child component found: counterValue

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
