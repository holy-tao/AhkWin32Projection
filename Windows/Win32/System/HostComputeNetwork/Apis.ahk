#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\HCN_PORT_RANGE_ENTRY.ahk" { HCN_PORT_RANGE_ENTRY }
#Import ".\HCN_PORT_RANGE_RESERVATION.ahk" { HCN_PORT_RANGE_RESERVATION }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HCN_PORT_ACCESS.ahk" { HCN_PORT_ACCESS }
#Import ".\HCN_PORT_PROTOCOL.ahk" { HCN_PORT_PROTOCOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.HostComputeNetwork
 */

;@region Functions
/**
 * HcnEnumerateNetworks
 * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
 * @param {Pointer<PWSTR>} Networks A list of IDs for each Network.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateNetworks
 */
export HcnEnumerateNetworks(Query, Networks, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    NetworksMarshal := Networks is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnEnumerateNetworks", "ptr", Query, NetworksMarshal, Networks, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnCreateNetwork
 * @param {Pointer<Guid>} Id Id for the new network.
 * @param {PWSTR} Settings JSON document specifying the settings of the [HostComputeNetwork](./../HNS_Schema.md#HostComputeNetwork).
 * @param {Pointer<Pointer<Void>>} Network Network for the new network.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateNetwork
 */
export HcnCreateNetwork(Id, Settings, Network, ErrorRecord) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    NetworkMarshal := Network is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnCreateNetwork", Guid.Ptr, Id, "ptr", Settings, NetworkMarshal, Network, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnOpenNetwork
 * @param {Pointer<Guid>} Id Id of the network.
 * @param {Pointer<Pointer<Void>>} Network Receives a handle to the network. It is the responsibility of the caller to release the handle using [HcnCloseNetwork](./HcnCloseNetwork.md) once it is no longer in use.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnOpenNetwork
 */
export HcnOpenNetwork(Id, Network, ErrorRecord) {
    NetworkMarshal := Network is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnOpenNetwork", Guid.Ptr, Id, NetworkMarshal, Network, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnModifyNetwork
 * @param {Pointer<Void>} Network Network for the new network.
 * @param {PWSTR} Settings JSON document specifying the settings of the [HostComputeNetwork](./../HNS_Schema.md#HostComputeNetwork).
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyNetwork
 */
export HcnModifyNetwork(Network, Settings) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    NetworkMarshal := Network is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnModifyNetwork", NetworkMarshal, Network, "ptr", Settings, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnQueryNetworkProperties
 * @param {Pointer<Void>} Network Handle to an network [`HCN_NETWORK`](./HCN_NETWORK.md)
 * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
 * @param {Pointer<PWSTR>} _Properties The properties in the form of a JSON document of [HostComputeNetwork](./../HNS_Schema.md#HostComputeNetwork).
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryNetworkProperties
 */
export HcnQueryNetworkProperties(Network, Query, _Properties, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    NetworkMarshal := Network is VarRef ? "ptr" : "ptr"
    _PropertiesMarshal := _Properties is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnQueryNetworkProperties", NetworkMarshal, Network, "ptr", Query, _PropertiesMarshal, _Properties, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnDeleteNetwork
 * @param {Pointer<Guid>} Id Id of the network to delete.
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteNetwork
 */
export HcnDeleteNetwork(Id) {
    result := DllCall("computenetwork.dll\HcnDeleteNetwork", Guid.Ptr, Id, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnCloseNetwork
 * @param {Pointer<Void>} Network 
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseNetwork
 */
export HcnCloseNetwork(Network) {
    NetworkMarshal := Network is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnCloseNetwork", NetworkMarshal, Network, "HRESULT")
    return result
}

/**
 * HcnEnumerateNamespaces
 * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
 * @param {Pointer<PWSTR>} Namespaces A list of IDs for each Namespace.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateNamespaces
 */
export HcnEnumerateNamespaces(Query, Namespaces, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    NamespacesMarshal := Namespaces is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnEnumerateNamespaces", "ptr", Query, NamespacesMarshal, Namespaces, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnCreateNamespace
 * @param {Pointer<Guid>} Id Id for the new namespace.
 * @param {PWSTR} Settings JSON document specifying the settings of the [namespace](./../HNS_Schema.md#HostComputeNamespace).
 * @param {Pointer<Pointer<Void>>} Namespace Receives a handle to the newly created namespace. It is the responsibility of the caller to release the handle using [HcnCloseNamespace](./HcnCloseNamespace.md) once it is no longer in use.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateNamespace
 */
export HcnCreateNamespace(Id, Settings, Namespace, ErrorRecord) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    NamespaceMarshal := Namespace is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnCreateNamespace", Guid.Ptr, Id, "ptr", Settings, NamespaceMarshal, Namespace, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnOpenNamespace
 * @param {Pointer<Guid>} Id Id of the namespace.
 * @param {Pointer<Pointer<Void>>} Namespace Receives a handle to the namespace. It is the responsibility of the caller to release the handle using [HcnCloseNamespace](./HcnCloseNamespace.md) once it is no longer in use.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnOpenNamespace
 */
export HcnOpenNamespace(Id, Namespace, ErrorRecord) {
    NamespaceMarshal := Namespace is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnOpenNamespace", Guid.Ptr, Id, NamespaceMarshal, Namespace, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnModifyNamespace
 * @param {Pointer<Void>} Namespace 
 * @param {PWSTR} Settings JSON document specifying the settings of the [namespace](./../HNS_Schema.md#HostComputeNamespace).
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyNamespace
 */
export HcnModifyNamespace(Namespace, Settings) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnModifyNamespace", NamespaceMarshal, Namespace, "ptr", Settings, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnQueryNamespaceProperties
 * @param {Pointer<Void>} Namespace Handle to an namespace [`HCN_NAMESPACE`](./HCN_NAMESPACE.md)
 * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
 * @param {Pointer<PWSTR>} _Properties The properties in the form of a JSON document of [HostComputeNamespace](./../HNS_Schema.md#HostComputeNamespace).
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryNamespaceProperties
 */
export HcnQueryNamespaceProperties(Namespace, Query, _Properties, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"
    _PropertiesMarshal := _Properties is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnQueryNamespaceProperties", NamespaceMarshal, Namespace, "ptr", Query, _PropertiesMarshal, _Properties, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnDeleteNamespace
 * @param {Pointer<Guid>} Id Id of the namespace to delete.
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteNamespace
 */
export HcnDeleteNamespace(Id) {
    result := DllCall("computenetwork.dll\HcnDeleteNamespace", Guid.Ptr, Id, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnCloseNamespace
 * @param {Pointer<Void>} Namespace Handle to a namespace [`HCN_NAMESPACE`](./HCN_NAMESPACE.md)
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseNamespace
 */
export HcnCloseNamespace(Namespace) {
    NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnCloseNamespace", NamespaceMarshal, Namespace, "HRESULT")
    return result
}

/**
 * HcnEnumerateEndpoints
 * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
 * @param {Pointer<PWSTR>} Endpoints A list of IDs for each Endpoint.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateEndpoints
 */
export HcnEnumerateEndpoints(Query, Endpoints, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    EndpointsMarshal := Endpoints is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnEnumerateEndpoints", "ptr", Query, EndpointsMarshal, Endpoints, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnCreateEndpoint
 * @param {Pointer<Void>} Network Network for the new endpoint.
 * @param {Pointer<Guid>} Id Id for the new endpoint.
 * @param {PWSTR} Settings JSON document specifying the settings of the [endpoint](./../HNS_Schema.md#HostComputeEndpoint).
 * @param {Pointer<Pointer<Void>>} Endpoint Receives a handle to the newly created endpoint. It is the responsibility of the caller to release the handle using [HcnCloseEndpoint](./HcnCloseEndpoint.md) once it is no longer in use.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateEndpoint
 */
export HcnCreateEndpoint(Network, Id, Settings, Endpoint, ErrorRecord) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    NetworkMarshal := Network is VarRef ? "ptr" : "ptr"
    EndpointMarshal := Endpoint is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnCreateEndpoint", NetworkMarshal, Network, Guid.Ptr, Id, "ptr", Settings, EndpointMarshal, Endpoint, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnOpenEndpoint
 * @param {Pointer<Guid>} Id Id of the endpoint.
 * @param {Pointer<Pointer<Void>>} Endpoint Receives a handle to the endpoint. It is the responsibility of the caller to release the handle using [HcnCloseEndpoint](./HcnCloseEndpoint.md) once it is no longer in use.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnOpenEndpoint
 */
export HcnOpenEndpoint(Id, Endpoint, ErrorRecord) {
    EndpointMarshal := Endpoint is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnOpenEndpoint", Guid.Ptr, Id, EndpointMarshal, Endpoint, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnModifyEndpoint
 * @param {Pointer<Void>} Endpoint The [HCN\_ENDPOINT](./HCN_ENDPOINT.md) to modify.
 * @param {PWSTR} Settings JSON document specifying the settings of the [endpoint](./../HNS_Schema.md#HostComputeEndpoint).
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyEndpoint
 */
export HcnModifyEndpoint(Endpoint, Settings) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnModifyEndpoint", EndpointMarshal, Endpoint, "ptr", Settings, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnQueryEndpointProperties
 * @param {Pointer<Void>} Endpoint Handle to an endpoint [`HCN_ENDPOINT`](./HCN_ENDPOINT.md)
 * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
 * @param {Pointer<PWSTR>} _Properties The properties in the form of a JSON document of [HostComputeEndpoint](./../HNS_Schema.md#HostComputeEndpoint).
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryEndpointProperties
 */
export HcnQueryEndpointProperties(Endpoint, Query, _Properties, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"
    _PropertiesMarshal := _Properties is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnQueryEndpointProperties", EndpointMarshal, Endpoint, "ptr", Query, _PropertiesMarshal, _Properties, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnDeleteEndpoint
 * @param {Pointer<Guid>} Id Id of the endpoint to delete.
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteEndpoint
 */
export HcnDeleteEndpoint(Id) {
    result := DllCall("computenetwork.dll\HcnDeleteEndpoint", Guid.Ptr, Id, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnCloseEndpoint
 * @param {Pointer<Void>} Endpoint Handle to an endpoint [`HCN_ENDPOINT`](./HCN_ENDPOINT.md)
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseEndpoint
 */
export HcnCloseEndpoint(Endpoint) {
    EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnCloseEndpoint", EndpointMarshal, Endpoint, "HRESULT")
    return result
}

/**
 * HcnEnumerateLoadBalancers
 * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
 * @param {Pointer<PWSTR>} LoadBalancer A list of IDs for each Load Bbalancer.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateLoadBalancers
 */
export HcnEnumerateLoadBalancers(Query, LoadBalancer, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnEnumerateLoadBalancers", "ptr", Query, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnCreateLoadBalancer
 * @param {Pointer<Guid>} Id Id for the new load balancer.
 * @param {PWSTR} Settings JSON document specifying the settings of the [load balancer](./../HNS_Schema.md#HostComputeLoadBalancer).
 * @param {Pointer<Pointer<Void>>} LoadBalancer Receives a handle to the newly created load balancer. It is the responsibility of the caller to release the handle using [HcnCloseLoadBalancer](./HcnCloseLoadBalancer.md) once it is no longer in use.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateLoadBalancer
 */
export HcnCreateLoadBalancer(Id, Settings, LoadBalancer, ErrorRecord) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnCreateLoadBalancer", Guid.Ptr, Id, "ptr", Settings, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnOpenLoadBalancer
 * @param {Pointer<Guid>} Id Id of the load balancer.
 * @param {Pointer<Pointer<Void>>} LoadBalancer Receives a handle to the load balancer. It is the responsibility of the caller to release the handle using [HcnCloseLoadBalancer](./HcnCloseLoadBalancer.md) once it is no longer in use.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnOpenLoadBalancer
 */
export HcnOpenLoadBalancer(Id, LoadBalancer, ErrorRecord) {
    LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnOpenLoadBalancer", Guid.Ptr, Id, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnModifyLoadBalancer
 * @param {Pointer<Void>} LoadBalancer The [HCN\_LOADBALANCER](./HCN_LOADBALANCER.md) to modify.
 * @param {PWSTR} Settings JSON document specifying the settings of the [load balancer](./../HNS_Schema.md#HostComputeLoadBalancer).
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyLoadBalancer
 */
export HcnModifyLoadBalancer(LoadBalancer, Settings) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnModifyLoadBalancer", LoadBalancerMarshal, LoadBalancer, "ptr", Settings, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnQueryLoadBalancerProperties
 * @param {Pointer<Void>} LoadBalancer Handle to an load balancer [`HCN_LOADBALANCER`](./HCN_LOADBALANCER.md)
 * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeLoadBalancer).
 * @param {Pointer<PWSTR>} _Properties The properties in the form of a JSON document of [HostComputeLoadBalancer](./../HNS_Schema.md#HostComputeLoadBalancer).
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryLoadBalancerProperties
 */
export HcnQueryLoadBalancerProperties(LoadBalancer, Query, _Properties, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"
    _PropertiesMarshal := _Properties is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnQueryLoadBalancerProperties", LoadBalancerMarshal, LoadBalancer, "ptr", Query, _PropertiesMarshal, _Properties, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnDeleteLoadBalancer
 * @param {Pointer<Guid>} Id Id of the load balancer to delete.
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteLoadBalancer
 */
export HcnDeleteLoadBalancer(Id) {
    result := DllCall("computenetwork.dll\HcnDeleteLoadBalancer", Guid.Ptr, Id, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnCloseLoadBalancer
 * @param {Pointer<Void>} LoadBalancer Handle to a LoadBalancer [`HCN_LOADBALANCER`](./HCN_LOADBALANCER.md)
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseLoadBalancer
 */
export HcnCloseLoadBalancer(LoadBalancer) {
    LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnCloseLoadBalancer", LoadBalancerMarshal, LoadBalancer, "HRESULT")
    return result
}

/**
 * HcnRegisterServiceCallback
 * @param {Pointer<HCN_NOTIFICATION_CALLBACK>} Callback The [HCN_NOTIFICATION_CALLBACK](./HCN_NOTIFICATION_CALLBACK.md) for the callback.
 * @param {Pointer<Void>} _Context Context that is provided on the callbacks.
 * @returns {Pointer<Void>} Receives a [HCN_CALLBACK](./HCN_CALLBACK.md). It is the responsibility of the caller to release the handle using [HcnUnregisterServiceCallback](./HcnUnregisterServiceCallback.md) once it is no longer in use.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnRegisterServiceCallback
 */
export HcnRegisterServiceCallback(Callback, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnRegisterServiceCallback", "ptr", Callback, _ContextMarshal, _Context, "ptr*", &CallbackHandle := 0, "HRESULT")
    return CallbackHandle
}

/**
 * HcnUnregisterServiceCallback
 * @param {Pointer<Void>} CallbackHandle The [HCN_CALLBACK](./HCN_CALLBACK.md) for the callback.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnUnregisterServiceCallback
 */
export HcnUnregisterServiceCallback(CallbackHandle) {
    CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnUnregisterServiceCallback", CallbackHandleMarshal, CallbackHandle, "HRESULT")
    return result
}

/**
 * HcnRegisterGuestNetworkServiceCallback
 * @param {Pointer<Void>} GuestNetworkService The [HCN_GUESTNETWORKSERVICE](./HCN_GUESTNETWORKSERVICE.md) for the callback.
 * @param {Pointer<HCN_NOTIFICATION_CALLBACK>} Callback The [HCN_NOTIFICATION_CALLBACK](./HCN_NOTIFICATION_CALLBACK.md) for the callback.
 * @param {Pointer<Void>} _Context Context that is provided on the callbacks.
 * @returns {Pointer<Void>} Receives a [HCN_CALLBACK](./HCN_CALLBACK.md). It is the responsibility of the caller to release the handle using [HcnUnregisterGuestNetworkServiceCallback](./HcnUnregisterGuestNetworkServiceCallback.md) once it is no longer in use.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnRegisterGuestNetworkServiceCallback
 */
export HcnRegisterGuestNetworkServiceCallback(GuestNetworkService, Callback, _Context) {
    GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnRegisterGuestNetworkServiceCallback", GuestNetworkServiceMarshal, GuestNetworkService, "ptr", Callback, _ContextMarshal, _Context, "ptr*", &CallbackHandle := 0, "HRESULT")
    return CallbackHandle
}

/**
 * HcnUnregisterGuestNetworkServiceCallback
 * @param {Pointer<Void>} CallbackHandle The [HCN_CALLBACK](./HCN_CALLBACK.md) for the callback.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnUnregisterGuestNetworkServiceCallback
 */
export HcnUnregisterGuestNetworkServiceCallback(CallbackHandle) {
    CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnUnregisterGuestNetworkServiceCallback", CallbackHandleMarshal, CallbackHandle, "HRESULT")
    return result
}

/**
 * HcnCreateGuestNetworkService
 * @param {Pointer<Guid>} Id Id for the new guest network service.
 * @param {PWSTR} Settings JSON document specifying the settings of the [guest network service](./../HNS_Schema.md#GuestNetworkService).
 * @param {Pointer<Pointer<Void>>} GuestNetworkService Receives a handle to the newly created guest network service. It is the responsibility of the caller to release the handle using [HcnCloseGuestNetworkService](./HcnCloseGuestNetworkService.md) once it is no longer in use.
 * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateGuestNetworkService
 */
export HcnCreateGuestNetworkService(Id, Settings, GuestNetworkService, ErrorRecord) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnCreateGuestNetworkService", Guid.Ptr, Id, "ptr", Settings, GuestNetworkServiceMarshal, GuestNetworkService, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * HcnCloseGuestNetworkService
 * @param {Pointer<Void>} GuestNetworkService Handle to a guest network service [`HCN_GUESTNETWORKSERVICE`](./HCN_GUESTNETWORKSERVICE.md)
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseGuestNetworkService
 */
export HcnCloseGuestNetworkService(GuestNetworkService) {
    GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnCloseGuestNetworkService", GuestNetworkServiceMarshal, GuestNetworkService, "HRESULT")
    return result
}

/**
 * HcnModifyGuestNetworkService
 * @param {Pointer<Void>} GuestNetworkService The [HCN\_GUESTNETWORKSERVICE](./HCN_GUESTNETWORKSERVICE.md) to modify.
 * @param {PWSTR} Settings JSON document specifying the settings of the [guest network service](./../HNS_Schema.md#GuestNetworkService).
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyGuestNetworkService
 */
export HcnModifyGuestNetworkService(GuestNetworkService, Settings) {
    Settings := Settings is String ? StrPtr(Settings) : Settings

    GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

    result := DllCall("computenetwork.dll\HcnModifyGuestNetworkService", GuestNetworkServiceMarshal, GuestNetworkService, "ptr", Settings, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnDeleteGuestNetworkService
 * @param {Pointer<Guid>} Id Id of the guest network service to delete.
 * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteGuestNetworkService
 */
export HcnDeleteGuestNetworkService(Id) {
    result := DllCall("computenetwork.dll\HcnDeleteGuestNetworkService", Guid.Ptr, Id, PWSTR.Ptr, &ErrorRecord := 0, "HRESULT")
    return ErrorRecord
}

/**
 * HcnReserveGuestNetworkServicePort
 * @param {Pointer<Void>} GuestNetworkService The [HCN_GUESTNETWORKSERVICE](./HCN_GUESTNETWORKSERVICE.md) for the reservation.
 * @param {HCN_PORT_PROTOCOL} Protocol The [HCN_PORT_PROTOCOL](./HCN_PORT_PROTOCOL.md) for the reservation.
 * @param {HCN_PORT_ACCESS} Access The [HCN_PORT_ACCESS](./HCN_PORT_ACCESS.md) for the reservation.
 * @param {Integer} Port The port for the reservation.
 * @returns {HANDLE} Receives a handle. It is the responsibility of the caller to release the handle using [HcnReleaseGuestNetworkServicePortReservationHandle](./HcnReleaseGuestNetworkServicePortReservationHandle.md) once it is no longer in use.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReserveGuestNetworkServicePort
 */
export HcnReserveGuestNetworkServicePort(GuestNetworkService, Protocol, Access, Port) {
    GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

    PortReservationHandle := HANDLE.Owned()
    result := DllCall("computenetwork.dll\HcnReserveGuestNetworkServicePort", GuestNetworkServiceMarshal, GuestNetworkService, HCN_PORT_PROTOCOL, Protocol, HCN_PORT_ACCESS, Access, "ushort", Port, HANDLE.Ptr, PortReservationHandle, "HRESULT")
    return PortReservationHandle
}

/**
 * HcnReserveGuestNetworkServicePortRange
 * @param {Pointer<Void>} GuestNetworkService The [HCN\_GUESTNETWORKSERVICE](./HCN_GUESTNETWORKSERVICE.md) for the reservation.
 * @param {Integer} PortCount The number of ports to reserve.
 * @param {Pointer<HCN_PORT_RANGE_RESERVATION>} PortRangeReservation The list of [HCN_PORT_RANGE_RESERVATION](./HCN_PORT_RANGE_RESERVATION.md) for the reservation.
 * @returns {HANDLE} Receives a handle. It is the responsibility of the caller to release the handle using [HcnReleaseGuestNetworkServicePortReservationHandle](./HcnReleaseGuestNetworkServicePortReservationHandle.md) once it is no longer in use.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReserveGuestNetworkServicePortRange
 */
export HcnReserveGuestNetworkServicePortRange(GuestNetworkService, PortCount, PortRangeReservation) {
    GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

    PortReservationHandle := HANDLE.Owned()
    result := DllCall("computenetwork.dll\HcnReserveGuestNetworkServicePortRange", GuestNetworkServiceMarshal, GuestNetworkService, "ushort", PortCount, HCN_PORT_RANGE_RESERVATION.Ptr, PortRangeReservation, HANDLE.Ptr, PortReservationHandle, "HRESULT")
    return PortReservationHandle
}

/**
 * HcnReleaseGuestNetworkServicePortReservationHandle
 * @param {HANDLE} PortReservationHandle The handle to the reservations to release.
 * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReleaseGuestNetworkServicePortReservationHandle
 */
export HcnReleaseGuestNetworkServicePortReservationHandle(PortReservationHandle) {
    result := DllCall("computenetwork.dll\HcnReleaseGuestNetworkServicePortReservationHandle", HANDLE, PortReservationHandle, "HRESULT")
    return result
}

/**
 * HcnEnumerateGuestNetworkPortReservations
 * @param {Integer} PortEntries Recieves the list of [port entries](./HCN_PORT_RANGE_ENTRY.md).
 * @returns {Integer} Recieves the count of reserved port entries.
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateGuestNetworkPortReservations
 */
export HcnEnumerateGuestNetworkPortReservations(PortEntries) {
    result := DllCall("computenetwork.dll\HcnEnumerateGuestNetworkPortReservations", "uint*", &ReturnCount := 0, "ptr", PortEntries, "HRESULT")
    return ReturnCount
}

/**
 * HcnFreeGuestNetworkPortReservations
 * @param {Pointer<HCN_PORT_RANGE_ENTRY>} PortEntries The list of [`HCN_PORT_RANGE_ENTRY`](./HCN_PORT_RANGE_ENTRY.md) instances to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnFreeGuestNetworkPortReservations
 */
export HcnFreeGuestNetworkPortReservations(PortEntries) {
    DllCall("computenetwork.dll\HcnFreeGuestNetworkPortReservations", HCN_PORT_RANGE_ENTRY.Ptr, PortEntries)
}

/**
 * 
 * @param {Pointer<Void>} Endpoint 
 * @param {PWSTR} Query 
 * @param {Pointer<PWSTR>} Stats 
 * @param {Pointer<PWSTR>} ErrorRecord 
 * @returns {HRESULT} 
 */
export HcnQueryEndpointStats(Endpoint, Query, Stats, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"
    StatsMarshal := Stats is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnQueryEndpointStats", EndpointMarshal, Endpoint, "ptr", Query, StatsMarshal, Stats, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} Endpoint 
 * @param {PWSTR} Query 
 * @param {Pointer<PWSTR>} Addresses 
 * @param {Pointer<PWSTR>} ErrorRecord 
 * @returns {HRESULT} 
 */
export HcnQueryEndpointAddresses(Endpoint, Query, Addresses, ErrorRecord) {
    Query := Query is String ? StrPtr(Query) : Query

    EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"
    AddressesMarshal := Addresses is VarRef ? "ptr*" : "ptr"
    ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("computenetwork.dll\HcnQueryEndpointAddresses", EndpointMarshal, Endpoint, "ptr", Query, AddressesMarshal, Addresses, ErrorRecordMarshal, ErrorRecord, "HRESULT")
    return result
}

;@endregion Functions
