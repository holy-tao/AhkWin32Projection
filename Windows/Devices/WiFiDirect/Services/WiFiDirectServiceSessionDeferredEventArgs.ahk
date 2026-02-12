#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectServiceSessionDeferredEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Returned when a [WiFiDirectService.SessionDeferred](wifidirectservice_sessiondeferred.md) event is raised.
 * @remarks
 * Your code does not instantiate this class directly. An instance of this class is passed as an argument to your [WiFiDirectService.SessionDeferred](wifidirectservice_sessiondeferred.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessiondeferredeventargs
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceSessionDeferredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectServiceSessionDeferredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectServiceSessionDeferredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the service-defined session information returned by the service when it sends a deferral in response to a connection request. Note that a deferral does not indicate that the connection is refused. Rather, it indicates that the server is performing a time-consuming operation such as requesting user input. A seeker should implement a 120-second timeout after getting a deferral before giving up on the request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessiondeferredeventargs.deferredsessioninfo
     * @type {IBuffer} 
     */
    DeferredSessionInfo {
        get => this.get_DeferredSessionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeferredSessionInfo() {
        if (!this.HasProp("__IWiFiDirectServiceSessionDeferredEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSessionDeferredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSessionDeferredEventArgs := IWiFiDirectServiceSessionDeferredEventArgs(outPtr)
        }

        return this.__IWiFiDirectServiceSessionDeferredEventArgs.get_DeferredSessionInfo()
    }

;@endregion Instance Methods
}
