let suite = new Project('haxeui-kha-testsuite');

console.log(`building for ${platform}`);

// suite.addParameter('--main externalXmlBindings.Main');
// suite.addParameter('--main internalXmlBindings.Main');
// suite.addParameter('--main swapComponents.Main');
// suite.addParameter('--main delayedAdd.Main');
suite.addParameter('--main kenneyButtonFlicker.Main');

suite.localLibraryPath = 'libs';

suite.addParameter('--times'); // (DK) show haxe compiler durations
suite.addDefine('macro-times');
suite.addParameter('-dce full');
suite.addDefine('analyzer_optimize');

switch (platform) {
	case 'debug-html5':
		suite.addLibrary('hxnodejs');
		break;
}

suite.addLibrary('haxeui-core');
suite.addLibrary('haxeui-kha');
suite.addLibrary('haxeui-theme-kenney');

suite.addSources('src');

resolve(suite);
