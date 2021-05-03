package kenneyButtonFlicker;

@:xml('
<box>
	<Button text="HOVER ME TO MAKE ME FLICKER ONCE" />
</box>
')
private class View extends Box {
	public function new() {
		super();
	}
}

class Main {
	public static function main() {
		kha.System.start({}, function( _ ) {
			kha.Assets.loadEverything(function() {
				haxe.ui.Toolkit.theme = 'kenney';
				haxe.ui.Toolkit.init({});
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
