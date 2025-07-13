'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "152e5f6d3a9baf8b7f0ad9ca29c31dc9",
"assets/AssetManifest.bin.json": "2d21dfd8bbe9240fdc1274689f397b3b",
"assets/AssetManifest.json": "b145453600eac20d48abdb72ffc1f6f0",
"assets/assets/1-portrait.png": "d8b87327dd3535bd56214208e76fa8cf",
"assets/assets/10-portrait.png": "201c03458bfdf8c698c2e7798178c7ef",
"assets/assets/11-portrait.png": "69a348962ea82c64b5e30d3f2a0500d9",
"assets/assets/13ef58d8a79d-portrait.png": "6c90fab0248f930b1d73ca41a2dfcc76",
"assets/assets/2-portrait.png": "f7b281e5f651e14476f6f7ef10a1286c",
"assets/assets/3-portrait.png": "034456c6e3fe96adac0172251caec3ea",
"assets/assets/3705526767cb-portrait.png": "fd3f3460190939c5be8f4f78ff0d02ee",
"assets/assets/4-portrait.png": "9771a87b460526764459c4b8b0693b4d",
"assets/assets/4ef38dff65c7-portrait.png": "eb3276b91f14e85611ba1645e0adb991",
"assets/assets/5-portrait.png": "44523a520fec86206663fd62e4f98084",
"assets/assets/56be08fe340f-portrait.png": "541e450b19d5422e31f0d328c3fe95fa",
"assets/assets/6-portrait.png": "0267cdd75c1b3f8ce8d2f19da43d8ed3",
"assets/assets/7-portrait.png": "e81986ef41112e9074e0eff3baff407d",
"assets/assets/8-portrait.png": "c722fb442e0b10b4cb62b9e129e45ee5",
"assets/assets/9-portrait.png": "9207ef0bee0be1bc29fba0b38e8a821d",
"assets/assets/932b7aeb3b10-portrait.png": "0ff5034e79b9b638dc758dc4c35abe8e",
"assets/assets/acc7fe5d2063-portrait.png": "f0cdd898e61342d631b626536ee19991",
"assets/assets/android_icon.png": "038ea15b40a395099451862327ebcfc1",
"assets/assets/avatar.png": "0bdf94fcae30003869130d8e3fd42597",
"assets/assets/dart.png": "1a089616e2be1ac7c5188c00225772c8",
"assets/assets/desktop_icon.png": "e0e90a080a776fd1da23f5a249b5ce3c",
"assets/assets/ef1e57336818-portrait.png": "5dd4ff695ddf86c09c2044ef34db7c5f",
"assets/assets/facebook.png": "fa74fe1619d75d68df1f0db7c654e39a",
"assets/assets/fbce13a5524d-portrait.png": "0a9053afa09fe54b8e19e2be61d70f00",
"assets/assets/firebase.png": "32f65ef666a36c741de77a5c27b3d502",
"assets/assets/flutter.png": "abe34b0551ded954f6759cada7807e3e",
"assets/assets/freelancer.png": "4beed4052f9b3296b77f1b79114ad689",
"assets/assets/github.png": "7aed3646cbea181a3da85620809e992c",
"assets/assets/instagram.png": "02c7721e097a6bb001d00fa61750bc81",
"assets/assets/ios_icon.png": "4b8039e8a442657c7b9b379322eb2793",
"assets/assets/linkedin.png": "e4d142586676a80b3927d899d3584148",
"assets/assets/python.png": "2e22a31d503a9ae4e7cfd61f40c62bd0",
"assets/assets/Screenshot_20250709_190621-portrait.png": "79d185af0ad93a72a9a41ec6fcb8d595",
"assets/assets/Screenshot_20250709_190701-portrait.png": "e187154e3dfcff6510ee5b59d8404164",
"assets/assets/Screenshot_20250709_190708-portrait.png": "74fe2b4ad39c69936a038a139ca2af95",
"assets/assets/Screenshot_20250709_190720-portrait.png": "51cdf9d57eb081f7453d5ced17f95c41",
"assets/assets/Screenshot_20250709_190840-portrait.png": "8aca97f87fec318bc2ecf11585e174c5",
"assets/assets/Screenshot_20250709_190852-portrait.png": "aee6de9d9b694b167244db0dd8cf4a27",
"assets/assets/Screenshot_20250709_190904-portrait.png": "7abf914f819be1f9796a71076242631a",
"assets/assets/Screenshot_20250709_195101-portrait.png": "9619aeb0a75f8529e344791781d5fe6f",
"assets/assets/Screenshot_20250709_200536-portrait.png": "4368142a2ad221da0f854e54b40ca1d3",
"assets/assets/Screenshot_20250709_200615-portrait.png": "ffa41d72a3f26eb557873e7281401331",
"assets/assets/Screenshot_20250709_200626-portrait.png": "b99ff8c88c774820ca79802216654469",
"assets/assets/Screenshot_20250709_200815-portrait.png": "dc2ce92bde081a7219666fa1c2508b41",
"assets/assets/Screenshot_20250709_200821-portrait.png": "47c3c9ce1db2dbc32680a3e12bb29c30",
"assets/assets/Screenshot_20250709_203214-portrait.png": "3b2c3a9ed28f4a756d4d5508fa2742e8",
"assets/assets/Screenshot_20250709_203232-portrait.png": "cff54da4f102217b23b05c3cf444ffb2",
"assets/assets/Screenshot_2025_0709_200748-portrait.png": "9c5d084506bf36570e6a9b13510e1a06",
"assets/assets/t1-portrait.png": "bf246be12dba53d6852f1d02c5f5096a",
"assets/assets/t2-portrait.png": "edfea454312152bc13ed8521c54350ef",
"assets/assets/t3-portrait.png": "4597159d87db0c916b0d2a5d2644a2c0",
"assets/assets/t4-portrait.png": "72f63edf1cd38768fe9ebaf504a61d37",
"assets/assets/t5-portrait.png": "0fc3c98d593cf238905af7b988a9486f",
"assets/assets/t6-portrait.png": "0056166d8e98092cc93c20534f15d60d",
"assets/assets/v1.png": "1e33cd40b614492fff7327805ace3cf2",
"assets/assets/v2.png": "02aba94db7d7a65da9b98c114c63ab37",
"assets/assets/v3.png": "92939fb08175457a59bcf8286c37f5c0",
"assets/assets/v4.png": "c9a9ce3a3928a32d449ee4bdc0df1312",
"assets/assets/v5.png": "67adaf766ec07cab2f9482d02678ddfa",
"assets/assets/v6.png": "da17ae8b5dade11e17121c71e498353e",
"assets/assets/v7.png": "6680a231877c2f8152133a749c347ef3",
"assets/assets/web_icon.png": "8867144689b70d099377ee3c4ab1baa0",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "cdf96cd876571aa48978abfc9bef16f0",
"assets/NOTICES": "67e04e26411295bffc4e6e55dfa76f20",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "b8de4d2a472714a196a189fc8ba8abf9",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "92e19927baddad9557f563440fa48a65",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "510120590b61e2d30c387d4022ef629e",
"/": "510120590b61e2d30c387d4022ef629e",
"main.dart.js": "e055de7f032befd08a714091c7f5b821",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"vercel.json": "c85542c0ab65c1716cd7d3d56ca277ee",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
