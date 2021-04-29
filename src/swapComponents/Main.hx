package swapComponents;

@:xml('<hbox><label text="Child 1" style="font-size: 24px; color: #fff;" /></hbox>')
private class Child1 extends HBox {
	public function new() {
		super();
	}
}

@:xml('<hbox><label text="Child 2" style="font-size: 24px; color: #ff0000;" /></hbox>')
private class Child2 extends HBox {
	public function new() {
		super();
	}
}

@:xml('
<hbox>
	<button id="changeChild" text="Change Child" />
</hbox>'
)
private class View extends HBox {
	final c1 = new Child1();
	final c2 = new Child2();

	var active: Component;

	public function new() {
		super();

		addComponent(active = c1);

		findComponent('changeChild', Button).onClick = function( e ) {
			removeComponent(active, false);
			addComponent(active = active == c1 ? c2 : c1);
		}
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
