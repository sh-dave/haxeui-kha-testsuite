package scrollview;

@:xml('
<box styleNames="wh-100">
	<style>
		.wh-100 {
			width: 100%;
			height: 100%;
		}

		/*.scrollview .horizontalscroll { hidden: true; }*/
		/*.scrollview .verticalscroll { hidden: true; }*/
	</style>

	<scrollview id="map" styleNames="wh-100" scrollMode="inertial">
		<absolute id="map">
			<image resource="file://map.png" />
		</absolute>
	</scrollview>

	<hbox>
		<button text="BACK" />
		<button text="CAMP" />
	</hbox>
</box>'
)
private class View extends Box {
	public function new() {
		super();

		final location1 = new Button();
		location1.text = 'MERCHANT';
		location1.left = 300;
		location1.top = 300;
		map.addComponent(location1);

		final location2 = new Button();
		location2.text = 'CRYPTS';
		location2.left = 600;
		location2.top = 450;
		map.addComponent(location2);
	}
}

class Main {
	public static function main() {
		kha.System.start({}, function( _ ) {
			kha.Assets.loadEverything(function() {
				haxe.ui.Toolkit.theme = 'dark';
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
