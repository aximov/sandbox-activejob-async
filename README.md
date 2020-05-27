# README

```sh
$ rails s
```

Access to `localhost:3000/ping`

```sh
Started GET "/ping" for ::1 at 2020-05-27 18:27:53 +0900
[ActiveJob] Enqueued HelloAsyncJob (Job ID: 8a2cf406-24a2-49c6-b69e-fab762a6c709) to Async(default)
deserializing: {"context-key"=>"context-value"}
[ActiveJob] [HelloAsyncJob] [8a2cf406-24a2-49c6-b69e-fab762a6c709] Performing HelloAsyncJob (Job ID: 8a2cf406-24a2-49c6-b69e-fab762a6c709) from Async(default) enqueued at 2020-05-27T09:27:53Z
did a thing
[ActiveJob] [HelloAsyncJob] [8a2cf406-24a2-49c6-b69e-fab762a6c709] Performed HelloAsyncJob (Job ID: 8a2cf406-24a2-49c6-b69e-fab762a6c709) from Async(default) in 1.38ms
```