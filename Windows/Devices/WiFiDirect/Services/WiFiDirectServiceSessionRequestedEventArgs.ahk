#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectServiceSessionRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Returned when a [WiFiDirectServiceAdvertiser.SessionRequested](wifidirectserviceadvertiser_sessionrequested.md) event is raised.
 * @remarks
 * Your code does not instantiate this class directly. An instance is passed as an argument to your [WiFiDirectServiceAdvertiser.SessionRequested](wifidirectserviceadvertiser_sessionrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionrequestedeventargs
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceSessionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectServiceSessionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectServiceSessionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets information about the session request that raised a [WiFiDirectServiceAdvertiser.SessionRequested](wifidirectserviceadvertiser_sessionrequested.md) event.
     * @returns {WiFiDirectServiceSessionRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionrequestedeventargs.getsessionrequest
     */
    GetSessionRequest() {
        if (!this.HasProp("__IWiFiDirectServiceSessionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSessionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSessionRequestedEventArgs := IWiFiDirectServiceSessionRequestedEventArgs(outPtr)
        }

        return this.__IWiFiDirectServiceSessionRequestedEventArgs.GetSessionRequest()
    }

;@endregion Instance Methods
}
