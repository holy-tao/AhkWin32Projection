#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.HostComputeNetwork
 * @version v4.0.30319
 */
class HostComputeNetwork {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * HcnEnumerateNetworks
     * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
     * @param {Pointer<PWSTR>} Networks A list of IDs for each Network.
     * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateNetworks
     */
    static HcnEnumerateNetworks(Query, Networks, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        NetworksMarshal := Networks is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnEnumerateNetworks", "ptr", Query, NetworksMarshal, Networks, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnCreateNetwork(Id, Settings, Network, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NetworkMarshal := Network is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateNetwork", "ptr", Id, "ptr", Settings, NetworkMarshal, Network, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnOpenNetwork(Id, Network, ErrorRecord) {
        NetworkMarshal := Network is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnOpenNetwork", "ptr", Id, NetworkMarshal, Network, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnModifyNetwork
     * @param {Pointer<Void>} Network Network for the new network.
     * @param {PWSTR} Settings JSON document specifying the settings of the [HostComputeNetwork](./../HNS_Schema.md#HostComputeNetwork).
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyNetwork
     */
    static HcnModifyNetwork(Network, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NetworkMarshal := Network is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyNetwork", NetworkMarshal, Network, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnQueryNetworkProperties
     * @param {Pointer<Void>} Network Handle to an network [`HCN_NETWORK`](./HCN_NETWORK.md)
     * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
     * @param {Pointer<PWSTR>} Properties The properties in the form of a JSON document of [HostComputeNetwork](./../HNS_Schema.md#HostComputeNetwork).
     * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryNetworkProperties
     */
    static HcnQueryNetworkProperties(Network, Query, Properties, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        NetworkMarshal := Network is VarRef ? "ptr" : "ptr"
        PropertiesMarshal := Properties is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryNetworkProperties", NetworkMarshal, Network, "ptr", Query, PropertiesMarshal, Properties, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnDeleteNetwork
     * @param {Pointer<Guid>} Id Id of the network to delete.
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteNetwork
     */
    static HcnDeleteNetwork(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteNetwork", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnCloseNetwork
     * @param {Pointer<Void>} Network 
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseNetwork
     */
    static HcnCloseNetwork(Network) {
        NetworkMarshal := Network is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseNetwork", NetworkMarshal, Network, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnEnumerateNamespaces(Query, Namespaces, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        NamespacesMarshal := Namespaces is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnEnumerateNamespaces", "ptr", Query, NamespacesMarshal, Namespaces, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnCreateNamespace(Id, Settings, Namespace, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NamespaceMarshal := Namespace is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateNamespace", "ptr", Id, "ptr", Settings, NamespaceMarshal, Namespace, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnOpenNamespace(Id, Namespace, ErrorRecord) {
        NamespaceMarshal := Namespace is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnOpenNamespace", "ptr", Id, NamespaceMarshal, Namespace, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnModifyNamespace
     * @param {Pointer<Void>} Namespace 
     * @param {PWSTR} Settings JSON document specifying the settings of the [namespace](./../HNS_Schema.md#HostComputeNamespace).
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyNamespace
     */
    static HcnModifyNamespace(Namespace, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyNamespace", NamespaceMarshal, Namespace, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnQueryNamespaceProperties
     * @param {Pointer<Void>} Namespace Handle to an namespace [`HCN_NAMESPACE`](./HCN_NAMESPACE.md)
     * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
     * @param {Pointer<PWSTR>} Properties The properties in the form of a JSON document of [HostComputeNamespace](./../HNS_Schema.md#HostComputeNamespace).
     * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryNamespaceProperties
     */
    static HcnQueryNamespaceProperties(Namespace, Query, Properties, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"
        PropertiesMarshal := Properties is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryNamespaceProperties", NamespaceMarshal, Namespace, "ptr", Query, PropertiesMarshal, Properties, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnDeleteNamespace
     * @param {Pointer<Guid>} Id Id of the namespace to delete.
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteNamespace
     */
    static HcnDeleteNamespace(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteNamespace", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnCloseNamespace
     * @param {Pointer<Void>} Namespace Handle to a namespace [`HCN_NAMESPACE`](./HCN_NAMESPACE.md)
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseNamespace
     */
    static HcnCloseNamespace(Namespace) {
        NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseNamespace", NamespaceMarshal, Namespace, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnEnumerateEndpoints(Query, Endpoints, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        EndpointsMarshal := Endpoints is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnEnumerateEndpoints", "ptr", Query, EndpointsMarshal, Endpoints, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnCreateEndpoint(Network, Id, Settings, Endpoint, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NetworkMarshal := Network is VarRef ? "ptr" : "ptr"
        EndpointMarshal := Endpoint is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateEndpoint", NetworkMarshal, Network, "ptr", Id, "ptr", Settings, EndpointMarshal, Endpoint, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnOpenEndpoint(Id, Endpoint, ErrorRecord) {
        EndpointMarshal := Endpoint is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnOpenEndpoint", "ptr", Id, EndpointMarshal, Endpoint, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnModifyEndpoint
     * @param {Pointer<Void>} Endpoint The [HCN\_ENDPOINT](./HCN_ENDPOINT.md) to modify.
     * @param {PWSTR} Settings JSON document specifying the settings of the [endpoint](./../HNS_Schema.md#HostComputeEndpoint).
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyEndpoint
     */
    static HcnModifyEndpoint(Endpoint, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyEndpoint", EndpointMarshal, Endpoint, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnQueryEndpointProperties
     * @param {Pointer<Void>} Endpoint Handle to an endpoint [`HCN_ENDPOINT`](./HCN_ENDPOINT.md)
     * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeQuery).
     * @param {Pointer<PWSTR>} Properties The properties in the form of a JSON document of [HostComputeEndpoint](./../HNS_Schema.md#HostComputeEndpoint).
     * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryEndpointProperties
     */
    static HcnQueryEndpointProperties(Endpoint, Query, Properties, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"
        PropertiesMarshal := Properties is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryEndpointProperties", EndpointMarshal, Endpoint, "ptr", Query, PropertiesMarshal, Properties, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnDeleteEndpoint
     * @param {Pointer<Guid>} Id Id of the endpoint to delete.
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteEndpoint
     */
    static HcnDeleteEndpoint(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteEndpoint", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnCloseEndpoint
     * @param {Pointer<Void>} Endpoint Handle to an endpoint [`HCN_ENDPOINT`](./HCN_ENDPOINT.md)
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseEndpoint
     */
    static HcnCloseEndpoint(Endpoint) {
        EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseEndpoint", EndpointMarshal, Endpoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnEnumerateLoadBalancers(Query, LoadBalancer, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnEnumerateLoadBalancers", "ptr", Query, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnCreateLoadBalancer(Id, Settings, LoadBalancer, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateLoadBalancer", "ptr", Id, "ptr", Settings, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnOpenLoadBalancer(Id, LoadBalancer, ErrorRecord) {
        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnOpenLoadBalancer", "ptr", Id, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnModifyLoadBalancer
     * @param {Pointer<Void>} LoadBalancer The [HCN\_LOADBALANCER](./HCN_LOADBALANCER.md) to modify.
     * @param {PWSTR} Settings JSON document specifying the settings of the [load balancer](./../HNS_Schema.md#HostComputeLoadBalancer).
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyLoadBalancer
     */
    static HcnModifyLoadBalancer(LoadBalancer, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyLoadBalancer", LoadBalancerMarshal, LoadBalancer, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnQueryLoadBalancerProperties
     * @param {Pointer<Void>} LoadBalancer Handle to an load balancer [`HCN_LOADBALANCER`](./HCN_LOADBALANCER.md)
     * @param {PWSTR} Query Optional JSON document of [HostComputeQuery](./../HNS_Schema.md#HostComputeLoadBalancer).
     * @param {Pointer<PWSTR>} Properties The properties in the form of a JSON document of [HostComputeLoadBalancer](./../HNS_Schema.md#HostComputeLoadBalancer).
     * @param {Pointer<PWSTR>} ErrorRecord Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryLoadBalancerProperties
     */
    static HcnQueryLoadBalancerProperties(LoadBalancer, Query, Properties, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"
        PropertiesMarshal := Properties is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryLoadBalancerProperties", LoadBalancerMarshal, LoadBalancer, "ptr", Query, PropertiesMarshal, Properties, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnDeleteLoadBalancer
     * @param {Pointer<Guid>} Id Id of the load balancer to delete.
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteLoadBalancer
     */
    static HcnDeleteLoadBalancer(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteLoadBalancer", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnCloseLoadBalancer
     * @param {Pointer<Void>} LoadBalancer Handle to a LoadBalancer [`HCN_LOADBALANCER`](./HCN_LOADBALANCER.md)
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseLoadBalancer
     */
    static HcnCloseLoadBalancer(LoadBalancer) {
        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseLoadBalancer", LoadBalancerMarshal, LoadBalancer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnRegisterServiceCallback
     * @param {Pointer<HCN_NOTIFICATION_CALLBACK>} Callback The [HCN_NOTIFICATION_CALLBACK](./HCN_NOTIFICATION_CALLBACK.md) for the callback.
     * @param {Pointer<Void>} Context Context that is provided on the callbacks.
     * @returns {Pointer<Void>} Receives a [HCN_CALLBACK](./HCN_CALLBACK.md). It is the responsibility of the caller to release the handle using [HcnUnregisterServiceCallback](./HcnUnregisterServiceCallback.md) once it is no longer in use.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnRegisterServiceCallback
     */
    static HcnRegisterServiceCallback(Callback, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnRegisterServiceCallback", "ptr", Callback, ContextMarshal, Context, "ptr*", &CallbackHandle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CallbackHandle
    }

    /**
     * HcnUnregisterServiceCallback
     * @param {Pointer<Void>} CallbackHandle The [HCN_CALLBACK](./HCN_CALLBACK.md) for the callback.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnUnregisterServiceCallback
     */
    static HcnUnregisterServiceCallback(CallbackHandle) {
        CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnUnregisterServiceCallback", CallbackHandleMarshal, CallbackHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnRegisterGuestNetworkServiceCallback
     * @param {Pointer<Void>} GuestNetworkService The [HCN_GUESTNETWORKSERVICE](./HCN_GUESTNETWORKSERVICE.md) for the callback.
     * @param {Pointer<HCN_NOTIFICATION_CALLBACK>} Callback The [HCN_NOTIFICATION_CALLBACK](./HCN_NOTIFICATION_CALLBACK.md) for the callback.
     * @param {Pointer<Void>} Context Context that is provided on the callbacks.
     * @returns {Pointer<Void>} Receives a [HCN_CALLBACK](./HCN_CALLBACK.md). It is the responsibility of the caller to release the handle using [HcnUnregisterGuestNetworkServiceCallback](./HcnUnregisterGuestNetworkServiceCallback.md) once it is no longer in use.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnRegisterGuestNetworkServiceCallback
     */
    static HcnRegisterGuestNetworkServiceCallback(GuestNetworkService, Callback, Context) {
        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnRegisterGuestNetworkServiceCallback", GuestNetworkServiceMarshal, GuestNetworkService, "ptr", Callback, ContextMarshal, Context, "ptr*", &CallbackHandle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CallbackHandle
    }

    /**
     * HcnUnregisterGuestNetworkServiceCallback
     * @param {Pointer<Void>} CallbackHandle The [HCN_CALLBACK](./HCN_CALLBACK.md) for the callback.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnUnregisterGuestNetworkServiceCallback
     */
    static HcnUnregisterGuestNetworkServiceCallback(CallbackHandle) {
        CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnUnregisterGuestNetworkServiceCallback", CallbackHandleMarshal, CallbackHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnCreateGuestNetworkService(Id, Settings, GuestNetworkService, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateGuestNetworkService", "ptr", Id, "ptr", Settings, GuestNetworkServiceMarshal, GuestNetworkService, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnCloseGuestNetworkService
     * @param {Pointer<Void>} GuestNetworkService Handle to a guest network service [`HCN_GUESTNETWORKSERVICE`](./HCN_GUESTNETWORKSERVICE.md)
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseGuestNetworkService
     */
    static HcnCloseGuestNetworkService(GuestNetworkService) {
        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseGuestNetworkService", GuestNetworkServiceMarshal, GuestNetworkService, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnModifyGuestNetworkService
     * @param {Pointer<Void>} GuestNetworkService The [HCN\_GUESTNETWORKSERVICE](./HCN_GUESTNETWORKSERVICE.md) to modify.
     * @param {PWSTR} Settings JSON document specifying the settings of the [guest network service](./../HNS_Schema.md#GuestNetworkService).
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyGuestNetworkService
     */
    static HcnModifyGuestNetworkService(GuestNetworkService, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyGuestNetworkService", GuestNetworkServiceMarshal, GuestNetworkService, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnDeleteGuestNetworkService
     * @param {Pointer<Guid>} Id Id of the guest network service to delete.
     * @returns {PWSTR} Receives a JSON document with extended errorCode information. The caller must release the buffer using CoTaskMemFree.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteGuestNetworkService
     */
    static HcnDeleteGuestNetworkService(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteGuestNetworkService", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ErrorRecord
    }

    /**
     * HcnReserveGuestNetworkServicePort
     * @param {Pointer<Void>} GuestNetworkService The [HCN_GUESTNETWORKSERVICE](./HCN_GUESTNETWORKSERVICE.md) for the reservation.
     * @param {Integer} Protocol The [HCN_PORT_PROTOCOL](./HCN_PORT_PROTOCOL.md) for the reservation.
     * @param {Integer} Access The [HCN_PORT_ACCESS](./HCN_PORT_ACCESS.md) for the reservation.
     * @param {Integer} Port The port for the reservation.
     * @param {Pointer<HANDLE>} PortReservationHandle Receives a handle. It is the responsibility of the caller to release the handle using [HcnReleaseGuestNetworkServicePortReservationHandle](./HcnReleaseGuestNetworkServicePortReservationHandle.md) once it is no longer in use.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReserveGuestNetworkServicePort
     */
    static HcnReserveGuestNetworkServicePort(GuestNetworkService, Protocol, Access, Port, PortReservationHandle) {
        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnReserveGuestNetworkServicePort", GuestNetworkServiceMarshal, GuestNetworkService, "int", Protocol, "int", Access, "ushort", Port, "ptr", PortReservationHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnReserveGuestNetworkServicePortRange
     * @param {Pointer<Void>} GuestNetworkService The [HCN\_GUESTNETWORKSERVICE](./HCN_GUESTNETWORKSERVICE.md) for the reservation.
     * @param {Integer} PortCount The number of ports to reserve.
     * @param {Pointer<HCN_PORT_RANGE_RESERVATION>} PortRangeReservation The list of [HCN_PORT_RANGE_RESERVATION](./HCN_PORT_RANGE_RESERVATION.md) for the reservation.
     * @param {Pointer<HANDLE>} PortReservationHandle Receives a handle. It is the responsibility of the caller to release the handle using [HcnReleaseGuestNetworkServicePortReservationHandle](./HcnReleaseGuestNetworkServicePortReservationHandle.md) once it is no longer in use.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReserveGuestNetworkServicePortRange
     */
    static HcnReserveGuestNetworkServicePortRange(GuestNetworkService, PortCount, PortRangeReservation, PortReservationHandle) {
        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnReserveGuestNetworkServicePortRange", GuestNetworkServiceMarshal, GuestNetworkService, "ushort", PortCount, "ptr", PortRangeReservation, "ptr", PortReservationHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnReleaseGuestNetworkServicePortReservationHandle
     * @param {HANDLE} PortReservationHandle The handle to the reservations to release.
     * @returns {HRESULT} The function returns [HRESULT](./HCNHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReleaseGuestNetworkServicePortReservationHandle
     */
    static HcnReleaseGuestNetworkServicePortReservationHandle(PortReservationHandle) {
        PortReservationHandle := PortReservationHandle is Win32Handle ? NumGet(PortReservationHandle, "ptr") : PortReservationHandle

        result := DllCall("computenetwork.dll\HcnReleaseGuestNetworkServicePortReservationHandle", "ptr", PortReservationHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcnEnumerateGuestNetworkPortReservations
     * @param {Pointer} PortEntries Recieves the list of [port entries](./HCN_PORT_RANGE_ENTRY.md).
     * @returns {Integer} Recieves the count of reserved port entries.
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateGuestNetworkPortReservations
     */
    static HcnEnumerateGuestNetworkPortReservations(PortEntries) {
        result := DllCall("computenetwork.dll\HcnEnumerateGuestNetworkPortReservations", "uint*", &ReturnCount := 0, "ptr", PortEntries, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ReturnCount
    }

    /**
     * HcnFreeGuestNetworkPortReservations
     * @param {Pointer<HCN_PORT_RANGE_ENTRY>} PortEntries The list of [`HCN_PORT_RANGE_ENTRY`](./HCN_PORT_RANGE_ENTRY.md) instances to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnFreeGuestNetworkPortReservations
     */
    static HcnFreeGuestNetworkPortReservations(PortEntries) {
        DllCall("computenetwork.dll\HcnFreeGuestNetworkPortReservations", "ptr", PortEntries)
    }

    /**
     * 
     * @param {Pointer<Void>} Endpoint 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Stats 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     */
    static HcnQueryEndpointStats(Endpoint, Query, Stats, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"
        StatsMarshal := Stats is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryEndpointStats", EndpointMarshal, Endpoint, "ptr", Query, StatsMarshal, Stats, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static HcnQueryEndpointAddresses(Endpoint, Query, Addresses, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"
        AddressesMarshal := Addresses is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryEndpointAddresses", EndpointMarshal, Endpoint, "ptr", Query, AddressesMarshal, Addresses, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
