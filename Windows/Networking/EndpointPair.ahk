#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEndpointPair.ahk
#Include .\IEndpointPairFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a pairing of local and remote host/service identifiers (host name or IP plus service name or port) used to initiate or describe a network connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.endpointpair
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class EndpointPair extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEndpointPair

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEndpointPair.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [EndpointPair](endpointpair.md) object.
     * @remarks
     * This constructor creates a new [EndpointPair](endpointpair.md) object from a local hostname, a local service name, a remote hostname, and a remote service name. The [EndpointPair](endpointpair.md) object provides data used by network apps for the local endpoint and remote endpoint for a network connection.
     * 
     * An endpoint consists of two components:
     * 
     * 
     * + The hostname or IP address.
     * + The service name or the TCP or UDP port number.
     * An endpoint pair consists of two components:
     * 
     * 
     * + The local endpoint for a network connection.
     * + The remote endpoint for a network connection.
     * The *localHostName* parameter can contain one of the following:
     * 
     * 
     * + The name of the local host that can be resolved by the Domain Name System (DNS) or by another namespace provider.
     * + The name of the local host that matches a string in the following file on the local computer: *%WINDIR%\\system32\drivers\etc\hosts*
     * + A string that contains an IPv4 or an IPv6 network address of the local host. An IPv4 address string is in dotted-decimal notation ("192.168.1.111", for example). An IPv6 address is in hexadecimal notation ("21DA:00D3:0010:2F3B:02AA:00FF:FE28:9C5A", for example).
     * If the *localHostName* parameter is the "localhost" string, this represents all loopback addresses on the local computer.
     * 
     * The [NetworkInformation.GetHostNames](../windows.networking.connectivity/networkinformation_gethostnames_136280557.md) method in the [Windows.Networking.Connectivity](../windows.networking.connectivity/windows_networking_connectivity.md) namespace can be used to retrieve a list of host names or IP addresses associated with the local machine. One of these hostnames or IP addresses can then be used for the *localHostName* parameter.
     * 
     * The *localHostName* parameter can also be set to null. If the *localHostName* is null before a network connection is established by a client app, then the system will automatically provide the local IP address for the app to use.
     * 
     * The *localServiceName* parameter can contain one of the following:
     * 
     * 
     * + A numeric literal for a TCP or UDP port number (80 for the TCP port used for http, for example).
     * + A string alias for a port number ("http", for example) that matches a string in the following file on the local computer: *%WINDIR%\system32\drivers\etc\services*
     * + A service name that can be resolved by a namespace provider using a SRV record.
     * The *localServiceName* parameter can also contain an empty string. If the local service name is an empty string for the local endpoint before a network connection is established, then the system will automatically provide a TCP or UDP IP port number for the app to use when establishing a network connection.
     * 
     * The constructor will fail if the *localServiceName* parameter is null.
     * 
     * The *remoteHostName* parameter can contain one of the following:
     * 
     * 
     * + The name of the remote host that can be resolved by the Domain Name System (DNS) or by another namespace provider.
     * + The name of the host that matches a string in the following file on the local computer: *%WINDIR%\\system32\drivers\etc\hosts*
     * + A string that contains an IPv4 or an IPv6 network address of the remote host. An IPv4 address string is in dotted-decimal notation ("192.168.1.111", for example). An IPv6 address is in hexadecimal notation ("21DA:00D3:0010:2F3B:02AA:00FF:FE28:9C5A", for example).
     * If the *remoteHostName* parameter is the "localhost" string, this represents all loopback addresses on the local computer.
     * 
     * The constructor will fail if the *remoteHostName* parameter is null or contains an empty string.
     * 
     * The *remoteServiceName* parameter can contain one of the following:
     * 
     * 
     * + A numeric literal for a TCP or UDP port number (80 for the TCP port used for http, for example).
     * + A string alias for a port number ("http", for example) that matches a string in the following file on the local computer: *%WINDIR%\system32\drivers\etc\services*
     * + A service name that can be resolved by a namespace provider using a SRV record.
     * The constructor will fail if the *remoteServiceName* parameter is null or contains an empty string.
     * @param {HostName} localHostName The local hostname or IP address for the [EndpointPair](endpointpair.md) object.
     * @param {HSTRING} localServiceName The local service name or the local TCP or UDP port number for the [EndpointPair](endpointpair.md) object.
     * @param {HostName} remoteHostName The remote hostname or IP address for the [EndpointPair](endpointpair.md) object.
     * @param {HSTRING} remoteServiceName The remote service name or the remote TCP or UDP port number for the [EndpointPair](endpointpair.md) object.
     * @returns {EndpointPair} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.endpointpair.#ctor
     */
    static CreateEndpointPair(localHostName, localServiceName, remoteHostName, remoteServiceName) {
        if (!EndpointPair.HasProp("__IEndpointPairFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.EndpointPair")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEndpointPairFactory.IID)
            EndpointPair.__IEndpointPairFactory := IEndpointPairFactory(factoryPtr)
        }

        return EndpointPair.__IEndpointPairFactory.CreateEndpointPair(localHostName, localServiceName, remoteHostName, remoteServiceName)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get or set the local hostname for the [EndpointPair](endpointpair.md) object.
     * @remarks
     * The LocalHostName property can contain a local hostname or an IP address.
     * 
     * The LocalHostName property can be set to one of the following:
     * 
     * 
     * + The name of the local host that can be resolved by the Domain Name System (DNS) or by another namespace provider.
     * + The name of the local host that matches a string in the following file on the local computer: *%WINDIR%\\system32\drivers\etc\hosts*
     * + A string that contains an IPv4 or an IPv6 network address of the local host. An IPv4 address string is in dotted-decimal notation ("192.168.1.111", for example). An IPv6 address is in hexadecimal notation ("21DA:00D3:0010:2F3B:02AA:00FF:FE28:9C5A", for example).
     * When this property is set to the "localhost" string, this represents all loopback addresses on the local computer.
     * 
     * The [NetworkInformation.GetHostNames](../windows.networking.connectivity/networkinformation_gethostnames_136280557.md) method in the [Windows.Networking.Connectivity](../windows.networking.connectivity/windows_networking_connectivity.md) namespace can be used to retrieve a list of hostnames or IP addresses associated with the local machine. The LocalHostName property can then be set to one of these hostnames or IP addresses.
     * 
     * The LocalHostName property can also be set to null. If the LocalHostName property is null before a network connection is established by a client app, then the system will automatically provide the local IP address for the app to use.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.endpointpair.localhostname
     * @type {HostName} 
     */
    LocalHostName {
        get => this.get_LocalHostName()
        set => this.put_LocalHostName(value)
    }

    /**
     * Get or set the local service name for the [EndpointPair](endpointpair.md) object.
     * @remarks
     * The LocalServiceName property can contain a service name or a TCP or UDP port number. The LocalServiceName property can be set to one of the following:
     * 
     * 
     * + A numeric literal for a TCP or UDP port number (80 for the TCP port typically used for http, for example).
     * + A string alias for a port number ("http", for example) that matches a string in the following file on the local computer: *%WINDIR%\system32\drivers\etc\services*
     * + A service name that can be resolved by a namespace provider using a SRV record.
     * The LocalServiceName property can also be set to an empty string. If the local service name is an empty string for the local endpoint before a network connection is established, then the system will automatically provide a TCP or UDP port number for the app to use when establishing a network connection.
     * 
     * It is an error to set the LocalServiceName property to null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.endpointpair.localservicename
     * @type {HSTRING} 
     */
    LocalServiceName {
        get => this.get_LocalServiceName()
        set => this.put_LocalServiceName(value)
    }

    /**
     * Get or set the remote hostname for the [EndpointPair](endpointpair.md) object.
     * @remarks
     * The RemoteHostName property can contain a hostname or an IP address to connect to. The remote hostname must be supplied for the remote endpoint of the [EndpointPair](endpointpair.md) object before a network connection can be established by a client app.
     * 
     * The RemoteHostName property can be set to one of the following:
     * 
     * 
     * + The name of the remote host that can be resolved by the Domain Name System (DNS) or by another namespace provider.
     * + The name of the host that matches a string in the following file on the local computer: *%WINDIR%\\system32\drivers\etc\hosts*
     * + A string that contains an IPv4 or an IPv6 network address of the remote host. An IPv4 address string is in dotted-decimal notation ("192.168.1.111", for example). An IPv6 address is in hexadecimal notation ("21DA:00D3:0010:2F3B:02AA:00FF:FE28:9C5A", for example).
     * When this property is set to the "localhost" string, this represents all loopback addresses on the local computer.
     * 
     * It is an error to set the RemoteHostName property to null or an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.endpointpair.remotehostname
     * @type {HostName} 
     */
    RemoteHostName {
        get => this.get_RemoteHostName()
        set => this.put_RemoteHostName(value)
    }

    /**
     * Get or set the remote service name for the [EndpointPair](endpointpair.md) object.
     * @remarks
     * The RemoteServiceName property can contain a service name or a TCP or UDP port number for a remote network destination. The remote service name must be supplied for the remote endpoint of the [EndpointPair](endpointpair.md) object before a network connection can be established by a client app.
     * 
     * The RemoteServiceName property can be set to one of the following:
     * 
     * 
     * + A numeric literal for a TCP or UDP port number (80 for the TCP port used for http, for example).
     * + A string alias for a port number ("http", for example) that matches a string in the following file on the local computer: *%WINDIR%\system32\drivers\etc\services*
     * + A service name that can be resolved by a namespace provider using a SRV record.
     * It is an error to set the RemoteServiceName property to null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.endpointpair.remoteservicename
     * @type {HSTRING} 
     */
    RemoteServiceName {
        get => this.get_RemoteServiceName()
        set => this.put_RemoteServiceName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalHostName() {
        if (!this.HasProp("__IEndpointPair")) {
            if ((queryResult := this.QueryInterface(IEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEndpointPair := IEndpointPair(outPtr)
        }

        return this.__IEndpointPair.get_LocalHostName()
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_LocalHostName(value) {
        if (!this.HasProp("__IEndpointPair")) {
            if ((queryResult := this.QueryInterface(IEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEndpointPair := IEndpointPair(outPtr)
        }

        return this.__IEndpointPair.put_LocalHostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalServiceName() {
        if (!this.HasProp("__IEndpointPair")) {
            if ((queryResult := this.QueryInterface(IEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEndpointPair := IEndpointPair(outPtr)
        }

        return this.__IEndpointPair.get_LocalServiceName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LocalServiceName(value) {
        if (!this.HasProp("__IEndpointPair")) {
            if ((queryResult := this.QueryInterface(IEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEndpointPair := IEndpointPair(outPtr)
        }

        return this.__IEndpointPair.put_LocalServiceName(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteHostName() {
        if (!this.HasProp("__IEndpointPair")) {
            if ((queryResult := this.QueryInterface(IEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEndpointPair := IEndpointPair(outPtr)
        }

        return this.__IEndpointPair.get_RemoteHostName()
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_RemoteHostName(value) {
        if (!this.HasProp("__IEndpointPair")) {
            if ((queryResult := this.QueryInterface(IEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEndpointPair := IEndpointPair(outPtr)
        }

        return this.__IEndpointPair.put_RemoteHostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteServiceName() {
        if (!this.HasProp("__IEndpointPair")) {
            if ((queryResult := this.QueryInterface(IEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEndpointPair := IEndpointPair(outPtr)
        }

        return this.__IEndpointPair.get_RemoteServiceName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteServiceName(value) {
        if (!this.HasProp("__IEndpointPair")) {
            if ((queryResult := this.QueryInterface(IEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEndpointPair := IEndpointPair(outPtr)
        }

        return this.__IEndpointPair.put_RemoteServiceName(value)
    }

;@endregion Instance Methods
}
