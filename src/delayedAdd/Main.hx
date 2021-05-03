package delayedAdd;

@:xml('
<button styleNames="hcenter vcenter" text="Click Me" />
')
private class Child extends Button {
	public function new() {
		super();
	}
}

@:xml('
<box styleNames="fullscreen">
	<style>
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
	</box>
</box>
')
private class View extends Box {
	public function new() {
		super();

// this doesn't work
#if 1
		contentRoot.addComponent(new Child());
#end
	}

// this works
#if 0
	public function addChild1() {
		contentRoot.addComponent(new Child());
	}
#end
}

class Main {
	public static function main() {
		kha.System.start({}, function( _ ) {
			kha.Assets.loadEverything(function() {
				haxe.ui.Toolkit.init({});

// this doesn't work
#if 1
				kha.Scheduler.addTimeTask(function() {
					haxe.ui.core.Screen.instance.addComponent(new View());
				}, 0.1);
#end

// this works
#if 0
				final view = new View();
				haxe.ui.core.Screen.instance.addComponent(view);

				kha.Scheduler.addTimeTask(function() {
					view.addChild1();
				}, 0.1);
#end

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
