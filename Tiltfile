trigger_mode(TRIGGER_MODE_MANUAL)

allow_k8s_contexts('k3d-local')

k8s_yaml(['k8s/node-web-app-test.yml', 'k8s/node-web-app-test2.yml'])
docker_build('iromain/node-web-app-test', 'node-web-app-test')
docker_build('iromain/node-web-app-test2', 'node-web-app-test2', live_update=[
  sync('node-web-app-test2', '/app')
])

# k8s_resource('node-web-app-test', port_forwards='9000', trigger_mode=TRIGGER_MODE_MANUAL)
k8s_resource('node-web-app-test', port_forwards='9000')
k8s_resource('node-web-app-test2', port_forwards='9001')