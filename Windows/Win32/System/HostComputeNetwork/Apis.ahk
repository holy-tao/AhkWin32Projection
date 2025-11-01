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
     * 
     * @param {PWSTR} Query 
     * @param {Pointer<PWSTR>} Networks 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateNetworks
     */
    static HcnEnumerateNetworks(Query, Networks, ErrorRecord) {
        Query := Query is String ? StrPtr(Query) : Query

        result := DllCall("computenetwork.dll\HcnEnumerateNetworks", "ptr", Query, "ptr", Networks, "ptr", ErrorRecord, "int")
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

        result := DllCall("computenetwork.dll\HcnCreateNetwork", "ptr", Id, "ptr", Settings, "ptr*", Network, "ptr", ErrorRecord, "int")
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
        result := DllCall("computenetwork.dll\HcnOpenNetwork", "ptr", Id, "ptr*", Network, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Network 
     * @param {PWSTR} Settings 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyNetwork
     */
    static HcnModifyNetwork(Network, Settings, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        result := DllCall("computenetwork.dll\HcnModifyNetwork", "ptr", Network, "ptr", Settings, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := DllCall("computenetwork.dll\HcnQueryNetworkProperties", "ptr", Network, "ptr", Query, "ptr", Properties, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteNetwork
     */
    static HcnDeleteNetwork(Id, ErrorRecord) {
        result := DllCall("computenetwork.dll\HcnDeleteNetwork", "ptr", Id, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Network 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseNetwork
     */
    static HcnCloseNetwork(Network) {
        result := DllCall("computenetwork.dll\HcnCloseNetwork", "ptr", Network, "int")
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

        result := DllCall("computenetwork.dll\HcnEnumerateNamespaces", "ptr", Query, "ptr", Namespaces, "ptr", ErrorRecord, "int")
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

        result := DllCall("computenetwork.dll\HcnCreateNamespace", "ptr", Id, "ptr", Settings, "ptr*", Namespace, "ptr", ErrorRecord, "int")
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
        result := DllCall("computenetwork.dll\HcnOpenNamespace", "ptr", Id, "ptr*", Namespace, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Namespace 
     * @param {PWSTR} Settings 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyNamespace
     */
    static HcnModifyNamespace(Namespace, Settings, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        result := DllCall("computenetwork.dll\HcnModifyNamespace", "ptr", Namespace, "ptr", Settings, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := DllCall("computenetwork.dll\HcnQueryNamespaceProperties", "ptr", Namespace, "ptr", Query, "ptr", Properties, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteNamespace
     */
    static HcnDeleteNamespace(Id, ErrorRecord) {
        result := DllCall("computenetwork.dll\HcnDeleteNamespace", "ptr", Id, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Namespace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseNamespace
     */
    static HcnCloseNamespace(Namespace) {
        result := DllCall("computenetwork.dll\HcnCloseNamespace", "ptr", Namespace, "int")
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

        result := DllCall("computenetwork.dll\HcnEnumerateEndpoints", "ptr", Query, "ptr", Endpoints, "ptr", ErrorRecord, "int")
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

        result := DllCall("computenetwork.dll\HcnCreateEndpoint", "ptr", Network, "ptr", Id, "ptr", Settings, "ptr*", Endpoint, "ptr", ErrorRecord, "int")
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
        result := DllCall("computenetwork.dll\HcnOpenEndpoint", "ptr", Id, "ptr*", Endpoint, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Endpoint 
     * @param {PWSTR} Settings 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyEndpoint
     */
    static HcnModifyEndpoint(Endpoint, Settings, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        result := DllCall("computenetwork.dll\HcnModifyEndpoint", "ptr", Endpoint, "ptr", Settings, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := DllCall("computenetwork.dll\HcnQueryEndpointProperties", "ptr", Endpoint, "ptr", Query, "ptr", Properties, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteEndpoint
     */
    static HcnDeleteEndpoint(Id, ErrorRecord) {
        result := DllCall("computenetwork.dll\HcnDeleteEndpoint", "ptr", Id, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Endpoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseEndpoint
     */
    static HcnCloseEndpoint(Endpoint) {
        result := DllCall("computenetwork.dll\HcnCloseEndpoint", "ptr", Endpoint, "int")
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

        result := DllCall("computenetwork.dll\HcnEnumerateLoadBalancers", "ptr", Query, "ptr", LoadBalancer, "ptr", ErrorRecord, "int")
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

        result := DllCall("computenetwork.dll\HcnCreateLoadBalancer", "ptr", Id, "ptr", Settings, "ptr*", LoadBalancer, "ptr", ErrorRecord, "int")
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
        result := DllCall("computenetwork.dll\HcnOpenLoadBalancer", "ptr", Id, "ptr*", LoadBalancer, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} LoadBalancer 
     * @param {PWSTR} Settings 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyLoadBalancer
     */
    static HcnModifyLoadBalancer(LoadBalancer, Settings, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        result := DllCall("computenetwork.dll\HcnModifyLoadBalancer", "ptr", LoadBalancer, "ptr", Settings, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := DllCall("computenetwork.dll\HcnQueryLoadBalancerProperties", "ptr", LoadBalancer, "ptr", Query, "ptr", Properties, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteLoadBalancer
     */
    static HcnDeleteLoadBalancer(Id, ErrorRecord) {
        result := DllCall("computenetwork.dll\HcnDeleteLoadBalancer", "ptr", Id, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} LoadBalancer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnCloseLoadBalancer
     */
    static HcnCloseLoadBalancer(LoadBalancer) {
        result := DllCall("computenetwork.dll\HcnCloseLoadBalancer", "ptr", LoadBalancer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HCN_NOTIFICATION_CALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<Pointer<Void>>} CallbackHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnRegisterServiceCallback
     */
    static HcnRegisterServiceCallback(Callback, Context, CallbackHandle) {
        result := DllCall("computenetwork.dll\HcnRegisterServiceCallback", "ptr", Callback, "ptr", Context, "ptr*", CallbackHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnUnregisterServiceCallback
     */
    static HcnUnregisterServiceCallback(CallbackHandle) {
        result := DllCall("computenetwork.dll\HcnUnregisterServiceCallback", "ptr", CallbackHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @param {Pointer<HCN_NOTIFICATION_CALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<Pointer<Void>>} CallbackHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnRegisterGuestNetworkServiceCallback
     */
    static HcnRegisterGuestNetworkServiceCallback(GuestNetworkService, Callback, Context, CallbackHandle) {
        result := DllCall("computenetwork.dll\HcnRegisterGuestNetworkServiceCallback", "ptr", GuestNetworkService, "ptr", Callback, "ptr", Context, "ptr*", CallbackHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnUnregisterGuestNetworkServiceCallback
     */
    static HcnUnregisterGuestNetworkServiceCallback(CallbackHandle) {
        result := DllCall("computenetwork.dll\HcnUnregisterGuestNetworkServiceCallback", "ptr", CallbackHandle, "int")
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

        result := DllCall("computenetwork.dll\HcnCreateGuestNetworkService", "ptr", Id, "ptr", Settings, "ptr*", GuestNetworkService, "ptr", ErrorRecord, "int")
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
        result := DllCall("computenetwork.dll\HcnCloseGuestNetworkService", "ptr", GuestNetworkService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @param {PWSTR} Settings 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnModifyGuestNetworkService
     */
    static HcnModifyGuestNetworkService(GuestNetworkService, Settings, ErrorRecord) {
        Settings := Settings is String ? StrPtr(Settings) : Settings

        result := DllCall("computenetwork.dll\HcnModifyGuestNetworkService", "ptr", GuestNetworkService, "ptr", Settings, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Id 
     * @param {Pointer<PWSTR>} ErrorRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnDeleteGuestNetworkService
     */
    static HcnDeleteGuestNetworkService(Id, ErrorRecord) {
        result := DllCall("computenetwork.dll\HcnDeleteGuestNetworkService", "ptr", Id, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @param {Integer} Protocol 
     * @param {Integer} Access 
     * @param {Integer} Port 
     * @param {Pointer<HANDLE>} PortReservationHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReserveGuestNetworkServicePort
     */
    static HcnReserveGuestNetworkServicePort(GuestNetworkService, Protocol, Access, Port, PortReservationHandle) {
        result := DllCall("computenetwork.dll\HcnReserveGuestNetworkServicePort", "ptr", GuestNetworkService, "int", Protocol, "int", Access, "ushort", Port, "ptr", PortReservationHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} GuestNetworkService 
     * @param {Integer} PortCount 
     * @param {Pointer<HCN_PORT_RANGE_RESERVATION>} PortRangeReservation 
     * @param {Pointer<HANDLE>} PortReservationHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnReserveGuestNetworkServicePortRange
     */
    static HcnReserveGuestNetworkServicePortRange(GuestNetworkService, PortCount, PortRangeReservation, PortReservationHandle) {
        result := DllCall("computenetwork.dll\HcnReserveGuestNetworkServicePortRange", "ptr", GuestNetworkService, "ushort", PortCount, "ptr", PortRangeReservation, "ptr", PortReservationHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<Integer>} ReturnCount 
     * @param {Pointer} PortEntries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HcnEnumerateGuestNetworkPortReservations
     */
    static HcnEnumerateGuestNetworkPortReservations(ReturnCount, PortEntries) {
        result := DllCall("computenetwork.dll\HcnEnumerateGuestNetworkPortReservations", "uint*", ReturnCount, "ptr", PortEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := DllCall("computenetwork.dll\HcnQueryEndpointStats", "ptr", Endpoint, "ptr", Query, "ptr", Stats, "ptr", ErrorRecord, "int")
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

        result := DllCall("computenetwork.dll\HcnQueryEndpointAddresses", "ptr", Endpoint, "ptr", Query, "ptr", Addresses, "ptr", ErrorRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
