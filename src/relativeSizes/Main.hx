package relativeSizes;

@:xml('
<box styleNames="fullscreen">
	<style>
		.w-1/5 {
			width: 20vw;
		}

		.h-1/5 {
			height: 20vh;
		}

		.fullscreen {
			width: 100%;
			height: 100%;
		}

		.hcenter {
			horizontal-align: center;
		}

		.vcenter {
			vertical-align: center;
		}
	</style>

	<box id="content-root" styleNames="fullscreen">
		<button styleNames="w-1/5 h-1/5 hcenter vcenter" text="OK" />
	</box>
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
