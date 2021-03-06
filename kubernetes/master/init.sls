{%- from "kubernetes/map.jinja" import master with context %}
include:
- kubernetes.master.service
- kubernetes.master.etcd
- kubernetes.master.api
- kubernetes.master.controller-manager
- kubernetes.master.scheduler
- kubernetes.master.kube-addons
{%- if master.network.engine == "opencontrail" %}
- kubernetes.master.opencontrail-network-manager
{%- endif %}
{%- if master.network.engine == "flannel" %}
- kubernetes.master.flannel
{%- endif %}
{%- if master.network.engine == "calico" %}
- kubernetes.master.calico
{%- endif %}
{%- if master.storage.get('engine', 'none') == 'glusterfs' %}
- kubernetes.master.glusterfs
{%- endif %}
- kubernetes.master.kubelet
