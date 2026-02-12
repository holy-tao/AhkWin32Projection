#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastPlugInStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppBroadcastState.PlugInStateChanged](./appbroadcaststate_pluginstatechanged.md) event.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginstatechangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPlugInStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastPlugInStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastPlugInStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new app broadcast plugin state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginstatechangedeventargs.pluginstate
     * @type {Integer} 
     */
    PlugInState {
        get => this.get_PlugInState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlugInState() {
        if (!this.HasProp("__IAppBroadcastPlugInStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugInStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugInStateChangedEventArgs := IAppBroadcastPlugInStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastPlugInStateChangedEventArgs.get_PlugInState()
    }

;@endregion Instance Methods
}
