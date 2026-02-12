#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastStreamStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppBroadcastState.StreamStateChanged](./appbroadcaststate_streamstatechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamstatechangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastStreamStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastStreamStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastStreamStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new state of the app broadcast stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamstatechangedeventargs.streamstate
     * @type {Integer} 
     */
    StreamState {
        get => this.get_StreamState()
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
    get_StreamState() {
        if (!this.HasProp("__IAppBroadcastStreamStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamStateChangedEventArgs := IAppBroadcastStreamStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastStreamStateChangedEventArgs.get_StreamState()
    }

;@endregion Instance Methods
}
