'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "888483df48293866f9f41d3d9274a779",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "fd091ea5bc8f3ccc10f74bd67179fb6a",
"index.html": "f9423da6d1e7c7e8a64dc6aa77721b2e",
"/": "f9423da6d1e7c7e8a64dc6aa77721b2e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "d83b135919a9c7bd2025423e9a13735f",
"assets/assets/logo.jpeg": "cf72efd98b1d0bc8025286101b5e11b2",
"assets/assets/mocca.jpg": "0f0f8f3e997192434a1abfd9c2be7180",
"assets/assets/americano.jpg": "61674abf1c8e2e3ee65e7796cc65d13b",
"assets/assets/chocolate_croissant.jpg": "1cb8492c019e913b286cf2e81e94febd",
"assets/assets/flat_white.jpg": "e7ca46f27db7b1c125368721e465d0c9",
"assets/assets/cangkir_kopi.jpeg": "ad2dde43f769466ef360c0990d59bc0e",
"assets/assets/muffin.jpg": "d92a6faf46a8f954e9f1525c9972d8e4",
"assets/assets/croissant_butter.jpg": "39aba40e60a9dcb8c0a57890cee12384",
"assets/assets/sparkling.jpg": "eef2472e1ff632b06d47b542ebe9a6e3",
"assets/assets/pasta.jpg": "fb3321014c725034dcf40c75a25a2105",
"assets/assets/espresso.jpg": "1d443dbe9ee7c65c8fd49d9c37df967b",
"assets/assets/brownies.jpg": "b677cadc17d7d97d6c39b0272c7697cc",
"assets/assets/iced_americano.jpg": "8736dcd754f26396c6495c07da8fc13e",
"assets/assets/greentea_latte.jpg": "63a9adf9ab75330b0bf3ee999a4f0fa9",
"assets/assets/grilled_chicken.jpg": "997d529fe2f665b7dbbe6fd211ca734d",
"assets/assets/panna_cotta.jpg": "44ee4f5203671ac5d4bb08c7eceb19a2",
"assets/assets/french_fries.jpg": "d4f84dcc55405e436e22bf6dff5371ce",
"assets/assets/hot_chocolate.jpg": "a18085d67d68d93de79d3eaa2591c6f0",
"assets/assets/peach_tea.jpg": "23186f07a3634883734f3e31b5acaeae",
"assets/assets/lemon_tea.jpg": "8451dda2a9311ec5957301e5939a7803",
"assets/assets/cheesecake.jpg": "22ae2276162a1e0a1b37c3915f0d0417",
"assets/assets/club_sandwich.jpg": "4cfe25a5034cd85fa31e6685924913ac",
"assets/assets/macchiato.jpg": "318aaad6b592adf9254c988b6ca5340d",
"assets/assets/iced_mocha.jpg": "f7f2f74aae7192a258b6faeae92fccf6",
"assets/assets/latte.jpg": "6303c374f53e05a0e11274a9e90cbbca",
"assets/assets/mineral.jpg": "5f26f254740b2a2a5e7bc1f8308e7f89",
"assets/assets/donut.jpg": "2765bf98adc6d34ed8a1ef6d9285aa29",
"assets/assets/cold_brew.jpg": "6c0455605db810dc1c634f4dbcfdfbb6",
"assets/assets/chicken_burger.jpg": "f78481a1bbf6b13353a8a2ebf5e8be5a",
"assets/assets/cinnamon_roll.jpg": "316bffdc81a1245ec6866e1cf4deb792",
"assets/assets/iced_macchiato.jpg": "c0f8dfec313ea32ed7cf8e06a9ef67de",
"assets/assets/matcha_frappe.jpg": "d28df4020036bd9602661773ad69a318",
"assets/assets/beef_burger.jpg": "205938f727d20fa4eae5c083cf9aa0f8",
"assets/assets/lychee_tea.jpg": "7cf79e694afb7d883b96fdeb2ded36de",
"assets/assets/iced_latte.jpg": "e597fb49160535f2af69c515dc7c06fa",
"assets/assets/tiramisu.jpg": "f6440d2b4232f75785ad943f70ad5057",
"assets/assets/red_velvet.jpg": "06755ebf77fe275125ab9817320e641a",
"assets/assets/taro_latte.jpg": "d2c00e91611dd0eee5c51d319380819d",
"assets/assets/chicken_wings.jpg": "b691e735b17284a653242987c005a52c",
"assets/assets/cappuccino.jpg": "b511006155221eeee19a1fe9f3e0b901",
"assets/fonts/MaterialIcons-Regular.otf": "4aba804dbba218a957773020fafe076f",
"assets/NOTICES": "189e0ee9bbced66547f5d3d610231b39",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "6557d8d7ccb7dd3ec5a1921ce513f6ef",
"assets/AssetManifest.json": "d4be73a420f25b14b1dcf653911dffdc",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "cb141fb8fee333b22de652b0efc126f4",
"version.json": "15235b5108d6a877ef74fe3317a96bf7",
"main.dart.js": "ca63a6854a877eeec2ba02129f5cf900"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
