#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.HostComputeNetwork
 * @version v4.0.30319
 */
class HostComputeNetwork {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Networks 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateNetworks
     */
    static HcnEnumerateNetworks(Query, Networks, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        NetworksMarshal := Networks is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnEnumerateNetworks", "ptr", Query, NetworksMarshal, Networks, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {PWSTR} Settings 
     * @param {Pointer<Pointer<Void>>} Network 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateNetwork
     */
    static HcnCreateNetwork(Id, Settings, Network, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NetworkMarshal := Network is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateNetwork", "ptr", Id, "ptr", Settings, NetworkMarshal, Network, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<Pointer<Void>>} Network 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnOpenNetwork
     */
    static HcnOpenNetwork(Id, Network, ErrorRecord) {
        NetworkMarshal := Network is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnOpenNetwork", "ptr", Id, NetworkMarshal, Network, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Network 
     * @param {PWSTR} Settings 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyNetwork
     */
    static HcnModifyNetwork(Network, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NetworkMarshal := Network is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyNetwork", NetworkMarshal, Network, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} Network 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Properties 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryNetworkProperties
     */
    static HcnQueryNetworkProperties(Network, Query, Properties, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        NetworkMarshal := Network is VarRef ? "ptr" : "ptr"
        PropertiesMarshal := Properties is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryNetworkProperties", NetworkMarshal, Network, "ptr", Query, PropertiesMarshal, Properties, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteNetwork
     */
    static HcnDeleteNetwork(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteNetwork", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} Network 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseNetwork
     */
    static HcnCloseNetwork(Network) {
        NetworkMarshal := Network is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseNetwork", NetworkMarshal, Network, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Namespaces 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateNamespaces
     */
    static HcnEnumerateNamespaces(Query, Namespaces, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        NamespacesMarshal := Namespaces is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnEnumerateNamespaces", "ptr", Query, NamespacesMarshal, Namespaces, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {PWSTR} Settings 
     * @param {Pointer<Pointer<Void>>} Namespace 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateNamespace
     */
    static HcnCreateNamespace(Id, Settings, Namespace, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NamespaceMarshal := Namespace is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateNamespace", "ptr", Id, "ptr", Settings, NamespaceMarshal, Namespace, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<Pointer<Void>>} Namespace 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnOpenNamespace
     */
    static HcnOpenNamespace(Id, Namespace, ErrorRecord) {
        NamespaceMarshal := Namespace is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnOpenNamespace", "ptr", Id, NamespaceMarshal, Namespace, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Namespace 
     * @param {PWSTR} Settings 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyNamespace
     */
    static HcnModifyNamespace(Namespace, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyNamespace", NamespaceMarshal, Namespace, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} Namespace 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Properties 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryNamespaceProperties
     */
    static HcnQueryNamespaceProperties(Namespace, Query, Properties, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"
        PropertiesMarshal := Properties is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryNamespaceProperties", NamespaceMarshal, Namespace, "ptr", Query, PropertiesMarshal, Properties, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteNamespace
     */
    static HcnDeleteNamespace(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteNamespace", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} Namespace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseNamespace
     */
    static HcnCloseNamespace(Namespace) {
        NamespaceMarshal := Namespace is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseNamespace", NamespaceMarshal, Namespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Endpoints 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateEndpoints
     */
    static HcnEnumerateEndpoints(Query, Endpoints, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        EndpointsMarshal := Endpoints is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnEnumerateEndpoints", "ptr", Query, EndpointsMarshal, Endpoints, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Network 
     * @param {Pointer<Guid>} Id 
     * @param {PWSTR} Settings 
     * @param {Pointer<Pointer<Void>>} Endpoint 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateEndpoint
     */
    static HcnCreateEndpoint(Network, Id, Settings, Endpoint, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        NetworkMarshal := Network is VarRef ? "ptr" : "ptr"
        EndpointMarshal := Endpoint is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateEndpoint", NetworkMarshal, Network, "ptr", Id, "ptr", Settings, EndpointMarshal, Endpoint, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<Pointer<Void>>} Endpoint 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnOpenEndpoint
     */
    static HcnOpenEndpoint(Id, Endpoint, ErrorRecord) {
        EndpointMarshal := Endpoint is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnOpenEndpoint", "ptr", Id, EndpointMarshal, Endpoint, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Endpoint 
     * @param {PWSTR} Settings 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyEndpoint
     */
    static HcnModifyEndpoint(Endpoint, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyEndpoint", EndpointMarshal, Endpoint, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} Endpoint 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Properties 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryEndpointProperties
     */
    static HcnQueryEndpointProperties(Endpoint, Query, Properties, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"
        PropertiesMarshal := Properties is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryEndpointProperties", EndpointMarshal, Endpoint, "ptr", Query, PropertiesMarshal, Properties, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteEndpoint
     */
    static HcnDeleteEndpoint(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteEndpoint", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} Endpoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseEndpoint
     */
    static HcnCloseEndpoint(Endpoint) {
        EndpointMarshal := Endpoint is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseEndpoint", EndpointMarshal, Endpoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} LoadBalancer 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateLoadBalancers
     */
    static HcnEnumerateLoadBalancers(Query, LoadBalancer, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnEnumerateLoadBalancers", "ptr", Query, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {PWSTR} Settings 
     * @param {Pointer<Pointer<Void>>} LoadBalancer 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateLoadBalancer
     */
    static HcnCreateLoadBalancer(Id, Settings, LoadBalancer, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateLoadBalancer", "ptr", Id, "ptr", Settings, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<Pointer<Void>>} LoadBalancer 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnOpenLoadBalancer
     */
    static HcnOpenLoadBalancer(Id, LoadBalancer, ErrorRecord) {
        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnOpenLoadBalancer", "ptr", Id, LoadBalancerMarshal, LoadBalancer, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} LoadBalancer 
     * @param {PWSTR} Settings 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyLoadBalancer
     */
    static HcnModifyLoadBalancer(LoadBalancer, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyLoadBalancer", LoadBalancerMarshal, LoadBalancer, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} LoadBalancer 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Properties 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnQueryLoadBalancerProperties
     */
    static HcnQueryLoadBalancerProperties(LoadBalancer, Query, Properties, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"
        PropertiesMarshal := Properties is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnQueryLoadBalancerProperties", LoadBalancerMarshal, LoadBalancer, "ptr", Query, PropertiesMarshal, Properties, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteLoadBalancer
     */
    static HcnDeleteLoadBalancer(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteLoadBalancer", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} LoadBalancer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseLoadBalancer
     */
    static HcnCloseLoadBalancer(LoadBalancer) {
        LoadBalancerMarshal := LoadBalancer is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseLoadBalancer", LoadBalancerMarshal, LoadBalancer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HCN_NOTIFICATION_CALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnRegisterServiceCallback
     */
    static HcnRegisterServiceCallback(Callback, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnRegisterServiceCallback", "ptr", Callback, ContextMarshal, Context, "ptr*", &CallbackHandle := 0, "int")
        if(result != 0)
            throw OSError(result)

        return CallbackHandle
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnUnregisterServiceCallback
     */
    static HcnUnregisterServiceCallback(CallbackHandle) {
        CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnUnregisterServiceCallback", CallbackHandleMarshal, CallbackHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @param {Pointer<HCN_NOTIFICATION_CALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnRegisterGuestNetworkServiceCallback
     */
    static HcnRegisterGuestNetworkServiceCallback(GuestNetworkService, Callback, Context) {
        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnRegisterGuestNetworkServiceCallback", GuestNetworkServiceMarshal, GuestNetworkService, "ptr", Callback, ContextMarshal, Context, "ptr*", &CallbackHandle := 0, "int")
        if(result != 0)
            throw OSError(result)

        return CallbackHandle
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnUnregisterGuestNetworkServiceCallback
     */
    static HcnUnregisterGuestNetworkServiceCallback(CallbackHandle) {
        CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnUnregisterGuestNetworkServiceCallback", CallbackHandleMarshal, CallbackHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {PWSTR} Settings 
     * @param {Pointer<Pointer<Void>>} GuestNetworkService 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCreateGuestNetworkService
     */
    static HcnCreateGuestNetworkService(Id, Settings, GuestNetworkService, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr*" : "ptr"
        ErrorRecordMarshal := ErrorRecord is VarRef ? "ptr*" : "ptr"

        result := DllCall("computenetwork.dll\HcnCreateGuestNetworkService", "ptr", Id, "ptr", Settings, GuestNetworkServiceMarshal, GuestNetworkService, ErrorRecordMarshal, ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseGuestNetworkService
     */
    static HcnCloseGuestNetworkService(GuestNetworkService) {
        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnCloseGuestNetworkService", GuestNetworkServiceMarshal, GuestNetworkService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @param {PWSTR} Settings 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyGuestNetworkService
     */
    static HcnModifyGuestNetworkService(GuestNetworkService, Settings) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

        result := DllCall("computenetwork.dll\HcnModifyGuestNetworkService", GuestNetworkServiceMarshal, GuestNetworkService, "ptr", Settings, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteGuestNetworkService
     */
    static HcnDeleteGuestNetworkService(Id) {
        result := DllCall("computenetwork.dll\HcnDeleteGuestNetworkService", "ptr", Id, "ptr*", &ErrorRecord := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ErrorRecord
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @param {Integer} Protocol 
     * @param {Integer} Access 
     * @param {Integer} Port 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReserveGuestNetworkServicePort
     */
    static HcnReserveGuestNetworkServicePort(GuestNetworkService, Protocol, Access, Port) {
        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

        PortReservationHandle := HANDLE()
        result := DllCall("computenetwork.dll\HcnReserveGuestNetworkServicePort", GuestNetworkServiceMarshal, GuestNetworkService, "int", Protocol, "int", Access, "ushort", Port, "ptr", PortReservationHandle, "int")
        if(result != 0)
            throw OSError(result)

        return PortReservationHandle
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @param {Integer} PortCount 
     * @param {Pointer<HCN_PORT_RANGE_RESERVATION>} PortRangeReservation 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReserveGuestNetworkServicePortRange
     */
    static HcnReserveGuestNetworkServicePortRange(GuestNetworkService, PortCount, PortRangeReservation) {
        GuestNetworkServiceMarshal := GuestNetworkService is VarRef ? "ptr" : "ptr"

        PortReservationHandle := HANDLE()
        result := DllCall("computenetwork.dll\HcnReserveGuestNetworkServicePortRange", GuestNetworkServiceMarshal, GuestNetworkService, "ushort", PortCount, "ptr", PortRangeReservation, "ptr", PortReservationHandle, "int")
        if(result != 0)
            throw OSError(result)

        return PortReservationHandle
    }

    /**
     * 
     * @param {HANDLE} PortReservationHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReleaseGuestNetworkServicePortReservationHandle
     */
    static HcnReleaseGuestNetworkServicePortReservationHandle(PortReservationHandle) {
        PortReservationHandle := PortReservationHandle is Win32Handle ? NumGet(PortReservationHandle, "ptr") : PortReservationHandle

        result := DllCall("computenetwork.dll\HcnReleaseGuestNetworkServicePortReservationHandle", "ptr", PortReservationHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} PortEntries 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateGuestNetworkPortReservations
     */
    static HcnEnumerateGuestNetworkPortReservations(PortEntries) {
        result := DllCall("computenetwork.dll\HcnEnumerateGuestNetworkPortReservations", "uint*", &ReturnCount := 0, "ptr", PortEntries, "int")
        if(result != 0)
            throw OSError(result)

        return ReturnCount
    }

    /**
     * 
     * @param {Pointer<HCN_PORT_RANGE_ENTRY>} PortEntries 
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
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
