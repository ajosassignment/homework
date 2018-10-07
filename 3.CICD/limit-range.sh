echo '{
    "kind": "LimitRange",
    "apiVersion": "v1",
    "metadata": {
        "name": "limits",
        "creationTimestamp": null
    },
    "spec": {
        "limits": [
            {
                "type": "Pod",
                "max": {
                    "cpu": "100m",
                    "memory": "2000Mi"
                },
                "min": {
                    "cpu": "10m",
                    "memory": "1000Mi"
                }
            },
            {
                "type": "Container",
                "max": {
                    "cpu": "100m",
                    "memory": "2000Mi"
                },
                "min": {
                    "cpu": "10m",
                    "memory": "1000Mi"
                },
                "default": {
                    "cpu": "50m",
                    "memory": "1000Mi"
                }
            }
        ]
    }
}' | oc create -f - -n tasks-prod
