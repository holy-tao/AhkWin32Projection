#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDnssdServiceWatcher.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DnssdServiceWatcher.ahk
#Include .\DnssdServiceInstance.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Maintains a collection of available DNS Service Discovery (DNS-SD) service instances.
  * 
  * > [!NOTE]
  * > DnssdServiceWatcher is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
  * 
  * > [!NOTE]
  * > Win32 DNS Service Discovery (DNS-SD) APIs are declared in the [windns.h header](/windows/win32/api/windns/). For example, the Win32 APIs for announcing and discovering services are [DnsServiceRegister](/windows/win32/api/windns/nf-windns-dnsserviceregister) and [DnsServiceBrowse](/windows/win32/api/windns/nf-windns-dnsservicebrowse).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdservicewatcher
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class DnssdServiceWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDnssdServiceWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDnssdServiceWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current status of the [DnssdServiceWatcherStatus](dnssdservicewatcherstatus.md).
     * 
     * > [!NOTE]
     * > DnssdServiceWatcher is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdservicewatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Event that is triggered when a [DnssdServiceWatcher](dnssdservicewatcher.md) has added a DNS Service Discovery (DNS-SD) instance to its collection of available service instances.
     * 
     * > [!NOTE]
     * > DnssdServiceWatcher is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @type {TypedEventHandler<DnssdServiceWatcher, DnssdServiceInstance>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e617711e-cdd5-5975-8fb3-8eaaaed24e7b}"),
                    DnssdServiceWatcher,
                    DnssdServiceInstance
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Event triggered when a [DnssdServiceWatcher](dnssdservicewatcher.md) has finished enumerating available DNS Service Discovery (DNS-SD) service instances.
     * 
     * > [!NOTE]
     * > DnssdServiceWatcher is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @type {TypedEventHandler<DnssdServiceWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6a6cc5d5-9f43-545a-91d7-3a40055475da}"),
                    DnssdServiceWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Event triggered when an in-progress enumeration has been stopped.
     * 
     * > [!NOTE]
     * > DnssdServiceWatcher is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @type {TypedEventHandler<DnssdServiceWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6a6cc5d5-9f43-545a-91d7-3a40055475da}"),
                    DnssdServiceWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAddedToken")) {
            this.remove_Added(this.__OnAddedToken)
            this.__OnAdded.iface.Dispose()
        }

        if(this.HasProp("__OnEnumerationCompletedToken")) {
            this.remove_EnumerationCompleted(this.__OnEnumerationCompletedToken)
            this.__OnEnumerationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnStoppedToken")) {
            this.remove_Stopped(this.__OnStoppedToken)
            this.__OnStopped.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<DnssdServiceWatcher, DnssdServiceInstance>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DnssdServiceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DnssdServiceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.get_Status()
    }

    /**
     * Starts an enumeration of the network for available DNS Service Discovery (DNS-SD) service instances.
     * 
     * > [!NOTE]
     * > DnssdServiceWatcher is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdservicewatcher.start
     */
    Start() {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.Start()
    }

    /**
     * Stops an in-progress enumeration of available DNS Service Discovery (DNS-SD) service instances.
     * 
     * > [!NOTE]
     * > DnssdServiceWatcher is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdservicewatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IDnssdServiceWatcher")) {
            if ((queryResult := this.QueryInterface(IDnssdServiceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdServiceWatcher := IDnssdServiceWatcher(outPtr)
        }

        return this.__IDnssdServiceWatcher.Stop()
    }

;@endregion Instance Methods
}
