#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastHeartbeatRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppBroadcastBackgroundService.HeartbeatRequested](appbroadcastbackgroundservice_heartbeatrequested.md) event which is raised by the system periodically to confirm that the broadcasting background task is currently active.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * In the handler for the [HeartbeatRequested](appbroadcastbackgroundservice_heartbeatrequested.md) event, set the [Handled](appbroadcastheartbeatrequestedeventargs_handled.md) property to true to confirm that the broadcasting background task is currently active.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastheartbeatrequestedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastHeartbeatRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastHeartbeatRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastHeartbeatRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether the broadcasting background task is currently active.
     * @remarks
     * Set this value to true in the handler for the [HeartbeatRequested](appbroadcastbackgroundservice_heartbeatrequested.md) event to confirm that the broadcasting background task is currently active.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastheartbeatrequestedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IAppBroadcastHeartbeatRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastHeartbeatRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastHeartbeatRequestedEventArgs := IAppBroadcastHeartbeatRequestedEventArgs(outPtr)
        }

        return this.__IAppBroadcastHeartbeatRequestedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IAppBroadcastHeartbeatRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastHeartbeatRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastHeartbeatRequestedEventArgs := IAppBroadcastHeartbeatRequestedEventArgs(outPtr)
        }

        return this.__IAppBroadcastHeartbeatRequestedEventArgs.get_Handled()
    }

;@endregion Instance Methods
}
