#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDnssdServiceInstance.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IDnssdServiceInstanceFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates an instance of a service that uses DNS Service Discovery (DNS-SD).
  * 
  * > [!NOTE]
  * > Win32 DNS Service Discovery (DNS-SD) APIs are declared in the [windns.h header](/windows/win32/api/windns/). For example, the Win32 APIs for announcing and discovering services are [DnsServiceRegister](/windows/win32/api/windns/nf-windns-dnsserviceregister) and [DnsServiceBrowse](/windows/win32/api/windns/nf-windns-dnsservicebrowse).
 * @remarks
 * Use this class if you are providing a service that advertises itself to other DNS-SD users, or if you are consuming services advertised via DNS-SD.
 * 
 * If your code attempts to register a service instance with the same name as a previously-registered service, your service will be renamed to avoid a conflict by adding a number in parentheses at the end of the name you specified. For example, if you specified "mygame" and that name was already registered for another service, your service would be renamed to something like, "mygame (2)". When this is done, [DnssdRegistrationResult.HasInstanceNameChanged](dnssdregistrationresult_hasinstancenamechanged.md) is set to **true**.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class DnssdServiceInstance extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDnssdServiceInstance

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDnssdServiceInstance.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new DnssdServiceInstance object with the specified instance name, host name, and port.
     * @param {HSTRING} dnssdServiceInstanceName The service instance name for the service instance being created.
     * @param {HostName} hostName_ The hostname for the service instance being created.
     * @param {Integer} port The port number for the service instance being created.
     * @returns {DnssdServiceInstance} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.#ctor
     */
    static Create(dnssdServiceInstanceName, hostName_, port) {
        if (!DnssdServiceInstance.HasProp("__IDnssdServiceInstanceFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.ServiceDiscovery.Dnssd.DnssdServiceInstance")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDnssdServiceInstanceFactory.IID)
            DnssdServiceInstance.__IDnssdServiceInstanceFactory := IDnssdServiceInstanceFactory(factoryPtr)
        }

        return DnssdServiceInstance.__IDnssdServiceInstanceFactory.Create(dnssdServiceInstanceName, hostName_, port)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the DNS-SD service instance name for this [DnssdServiceInstance](dnssdserviceinstance.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.dnssdserviceinstancename
     * @type {HSTRING} 
     */
    DnssdServiceInstanceName {
        get => this.get_DnssdServiceInstanceName()
        set => this.put_DnssdServiceInstanceName(value)
    }

    /**
     * Gets or sets the hostname of the host for this [DnssdServiceInstance](dnssdserviceinstance.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.hostname
     * @type {HostName} 
     */
    HostName {
        get => this.get_HostName()
        set => this.put_HostName(value)
    }

    /**
     * Gets or sets the port number used by this [DnssdServiceInstance](dnssdserviceinstance.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.port
     * @type {Integer} 
     */
    Port {
        get => this.get_Port()
        set => this.put_Port(value)
    }

    /**
     * Gets or sets the priority value to assign to this service instance, as defined in [RFC 2782 A DNS RR for specifying the location of services (DNS SRV)](https://www.ietf.org/rfc/rfc2782.txt). Clients use **Priority** to decide which of several equivalent service instances to attach to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.priority
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * Gets or sets the weight value assigned to this service instance, as defined in [RFC 2782](https://www.ietf.org/rfc/rfc2782.txt). Clients use the **Weight** value to choose between servers with the same **Priority** value.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.weight
     * @type {Integer} 
     */
    Weight {
        get => this.get_Weight()
        set => this.put_Weight(value)
    }

    /**
     * Gets the attributes of this service instance, as a list of [name, value] pairs of strings. Attributes can be inspected by service clients to determine additional information about a service instance.
     * 
     * The specific attribute names and values used by a service are determined by the designer of the service. For example, a service instance for a multiplayer game might have attributes describing which game map the instance is using, or the game difficulty level of the instance. Different service instances would be active for different maps or difficulty levels, and a client using the game service could use the attribute values to determine which game server instance to connect to for the player's preferred map or difficulty level.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.textattributes
     * @type {IMap<HSTRING, HSTRING>} 
     */
    TextAttributes {
        get => this.get_TextAttributes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DnssdServiceInstanceName() {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.get_DnssdServiceInstanceName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DnssdServiceInstanceName(value) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.put_DnssdServiceInstanceName(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_HostName() {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.get_HostName()
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_HostName(value) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.put_HostName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Port() {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.get_Port()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Port(value) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.put_Port(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.get_Priority()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Priority(value) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.put_Priority(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Weight() {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.get_Weight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Weight(value) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.put_Weight(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_TextAttributes() {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.get_TextAttributes()
    }

    /**
     * Asynchronously registers a stream (TCP) socket listener for the service, on the given socket and network adapter.
     * @param {StreamSocketListener} socket_ Describes the socket that this service instance uses to listen for new service clients.
     * @returns {IAsyncOperation<DnssdRegistrationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.registerstreamsocketlistenerasync
     */
    RegisterStreamSocketListenerAsync1(socket_) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.RegisterStreamSocketListenerAsync1(socket_)
    }

    /**
     * Asynchronously registers a stream (TCP) socket listener for the service, on the given socket.
     * @param {StreamSocketListener} socket_ Describes the socket that this service instance uses to listen for new service clients.
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncOperation<DnssdRegistrationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.registerstreamsocketlistenerasync
     */
    RegisterStreamSocketListenerAsync2(socket_, adapter_) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.RegisterStreamSocketListenerAsync2(socket_, adapter_)
    }

    /**
     * Asynchronously registers a datagram (UDP) socket listener for the service, on a given socket and network adapter.
     * @param {DatagramSocket} socket_ Describes the socket that this service instance uses to listen for new service clients.
     * @returns {IAsyncOperation<DnssdRegistrationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.registerdatagramsocketasync
     */
    RegisterDatagramSocketAsync1(socket_) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.RegisterDatagramSocketAsync1(socket_)
    }

    /**
     * Asynchronously registers a datagram (UDP) socket listener for the service, on a given socket.
     * @param {DatagramSocket} socket_ Describes the socket that this service instance uses to listen for new service clients.
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncOperation<DnssdRegistrationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.registerdatagramsocketasync
     */
    RegisterDatagramSocketAsync2(socket_, adapter_) {
        if (!this.HasProp("__IDnssdServiceInstance")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceInstance := IDnssdServiceInstance(outPtr)
        }

        return this.__IDnssdServiceInstance.RegisterDatagramSocketAsync2(socket_, adapter_)
    }

    /**
     * Gets the DNS Server Resource Record (SRV RR) of this service instance, as a string.
     * 
     * See [RFC 1034 DOMAIN NAMES - CONCEPTS AND FACILITIES](https://www.ietf.org/rfc/rfc1034.txt) for the format and contents of the DNS SRV RR, and [RFC 2782](https://www.ietf.org/rfc/rfc2782.txt) and [RFC 6763 DNS-Based Service Discovery](https://datatracker.ietf.org/doc/html/rfc6763) for details about how DNS-SD clients and servers use those records.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstance.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}
