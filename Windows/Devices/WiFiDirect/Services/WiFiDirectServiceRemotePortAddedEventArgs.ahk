#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectServiceRemotePortAddedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Returned when a [WiFiDirectServiceSession.RemotePortAdded](wifidirectservicesession_remoteportadded.md) event is raised. Your event handler should use this information to establish new socket connections to the new port.
 * @remarks
 * Your code does not instantiate this class directly. An instance is passed as an argument to your [WiFiDirectServiceSession.RemotePortAdded](wifidirectservicesession_remoteportadded.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceremoteportaddedeventargs
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceRemotePortAddedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectServiceRemotePortAddedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectServiceRemotePortAddedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the endpoint pairs associated with the new remote port.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceremoteportaddedeventargs.endpointpairs
     * @type {IVectorView<EndpointPair>} 
     */
    EndpointPairs {
        get => this.get_EndpointPairs()
    }

    /**
     * Gets the protocol used to communicate with the new remote port.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceremoteportaddedeventargs.protocol
     * @type {Integer} 
     */
    Protocol {
        get => this.get_Protocol()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<EndpointPair>} 
     */
    get_EndpointPairs() {
        if (!this.HasProp("__IWiFiDirectServiceRemotePortAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceRemotePortAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceRemotePortAddedEventArgs := IWiFiDirectServiceRemotePortAddedEventArgs(outPtr)
        }

        return this.__IWiFiDirectServiceRemotePortAddedEventArgs.get_EndpointPairs()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Protocol() {
        if (!this.HasProp("__IWiFiDirectServiceRemotePortAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceRemotePortAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceRemotePortAddedEventArgs := IWiFiDirectServiceRemotePortAddedEventArgs(outPtr)
        }

        return this.__IWiFiDirectServiceRemotePortAddedEventArgs.get_Protocol()
    }

;@endregion Instance Methods
}
