#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPeerInformation.ahk
#Include .\IPeerInformation3.ahk
#Include .\IPeerInformationWithHostAndService.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information that identifies a peer.
 * @remarks
 * A PeerInformation instance is created when you call the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method, and then passed to the [ConnectionRequested](peerfinder_connectionrequested.md) event. You can pass that instance to the [ConnectAsync](peerfinder_connectasync_380619906.md) method to accept a connection request from a peer.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerinformation
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class PeerInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPeerInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPeerInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display name of the peer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerinformation.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the app id for the peer app.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerinformation.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the device data included during device discovery.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerinformation.discoverydata
     * @type {IBuffer} 
     */
    DiscoveryData {
        get => this.get_DiscoveryData()
    }

    /**
     * Gets the hostname or IP address of the peer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerinformation.hostname
     * @type {HostName} 
     */
    HostName {
        get => this.get_HostName()
    }

    /**
     * Gets the service name or TCP port number of the peer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerinformation.servicename
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
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
    get_DisplayName() {
        if (!this.HasProp("__IPeerInformation")) {
            if ((queryResult := this.QueryInterface(IPeerInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerInformation := IPeerInformation(outPtr)
        }

        return this.__IPeerInformation.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IPeerInformation3")) {
            if ((queryResult := this.QueryInterface(IPeerInformation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerInformation3 := IPeerInformation3(outPtr)
        }

        return this.__IPeerInformation3.get_Id()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DiscoveryData() {
        if (!this.HasProp("__IPeerInformation3")) {
            if ((queryResult := this.QueryInterface(IPeerInformation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerInformation3 := IPeerInformation3(outPtr)
        }

        return this.__IPeerInformation3.get_DiscoveryData()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_HostName() {
        if (!this.HasProp("__IPeerInformationWithHostAndService")) {
            if ((queryResult := this.QueryInterface(IPeerInformationWithHostAndService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerInformationWithHostAndService := IPeerInformationWithHostAndService(outPtr)
        }

        return this.__IPeerInformationWithHostAndService.get_HostName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        if (!this.HasProp("__IPeerInformationWithHostAndService")) {
            if ((queryResult := this.QueryInterface(IPeerInformationWithHostAndService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerInformationWithHostAndService := IPeerInformationWithHostAndService(outPtr)
        }

        return this.__IPeerInformationWithHostAndService.get_ServiceName()
    }

;@endregion Instance Methods
}
