package scaledImageSize;

@:xml('
<box styleNames="my-view">
	<style>
		.my-view {
			width: 100%;
			height: 100%;
		}

		.logo {
			width: 100%;
			height: 100%;
		}
	</style>

	<image resource="big_kha_Logo.png" styleNames="logo" />
	<button text="CLICK" styleNames="click-me" />
</box>'
)
private class View extends Box {
	public function new() {
		super();
	}
}

class Main {
	public static function main() {
		kha.System.start({ width: Std.int(632 / 2), height: Std.int(612 / 2) }, function( _ ) {
			kha.Assets.loadEverything(function() {
				haxe.ui.Toolkit.theme = 'dark';
				haxe.ui.Toolkit.init({});
				haxe.ui.core.Screen.instance.addComponent(new View());
				haxe.ui.core.Screen.instance.options.noBatch = true;
				haxe.ui.Toolkit.scale = 3.0;

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
