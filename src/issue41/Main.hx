package issue41;

@:xml('
<hbox id="main" width="100%" height="100%">
    <style>
        #main {
            background-color: green;
        }
    </style>
</hbox>
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
