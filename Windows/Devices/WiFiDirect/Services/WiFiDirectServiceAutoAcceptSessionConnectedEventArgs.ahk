#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Returned when a [WiFiDirectServiceAdvertiser.AutoAcceptSessionConnected](wifidirectserviceadvertiser_autoacceptsessionconnected.md) event is raised.
 * @remarks
 * Your code does not instantiate this class directly. An instance is passed as an argument to your [WiFiDirectServiceAdvertiser.AutoAcceptSessionConnected](wifidirectserviceadvertiser_autoacceptsessionconnected.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceautoacceptsessionconnectedeventargs
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceAutoAcceptSessionConnectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [WiFiDirectServiceSession](wifidirectservicesession.md) that was created when the connection was automatically accepted.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceautoacceptsessionconnectedeventargs.session
     * @type {WiFiDirectServiceSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Gets the session information buffer that corresponds to this automatically accepted connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceautoacceptsessionconnectedeventargs.sessioninfo
     * @type {IBuffer} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WiFiDirectServiceSession} 
     */
    get_Session() {
        if (!this.HasProp("__IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs := IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs(outPtr)
        }

        return this.__IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs.get_Session()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionInfo() {
        if (!this.HasProp("__IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs := IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs(outPtr)
        }

        return this.__IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs.get_SessionInfo()
    }

;@endregion Instance Methods
}
