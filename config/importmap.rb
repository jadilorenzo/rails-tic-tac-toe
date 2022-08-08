# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "pusher", to: "https://ga.jspm.io/npm:pusher@5.1.1-beta/lib/pusher.js"
pin "abort-controller", to: "https://ga.jspm.io/npm:abort-controller@3.0.0/browser.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/buffer.js"
pin "crypto", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/crypto.js"
pin "is-base64", to: "https://ga.jspm.io/npm:is-base64@1.1.0/is-base64.js"
pin "node-fetch", to: "https://ga.jspm.io/npm:node-fetch@2.6.7/browser.js"
pin "tweetnacl", to: "https://ga.jspm.io/npm:tweetnacl@1.0.3/nacl-fast.js"
pin "tweetnacl-util", to: "https://ga.jspm.io/npm:tweetnacl-util@0.15.1/nacl-util.js"
pin "url", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/url.js"
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
