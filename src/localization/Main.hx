package localization;

@:xml('
<vbox>
	<label text="{{this_is_ok}}" style="color: #ffffff; font-size: 48px;" />
	<label text="{{this fails}}" />
</vbox>
')
private class View extends VBox {
	public function new() {
		super();
	}
}

class Main {
	public static function main() {
		kha.System.start({}, function( _ ) {
			kha.Assets.loadEverything(function() {
				kha.Scheduler.addTimeTask(function() {
					haxe.ui.Toolkit.init({});
					haxe.ui.locale.LocaleManager.instance.language = "de_DE";
					haxe.ui.core.Screen.instance.addComponent(new View());

					kha.System.notifyOnFrames(function( fbs ) {
						final fb = fbs[0];
						final g2 = fb.g2;

						g2.begin(true, 0xff004040);
							haxe.ui.core.Screen.instance.renderTo(g2);
						g2.end();
					});
				}, 0.1);
			});
		});
	}
}
