#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastMicrophoneCaptureStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppBroadcastState.MicrophoneCaptureStateChanged](./appbroadcaststate_microphonecapturestatechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastmicrophonecapturestatechangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastMicrophoneCaptureStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastMicrophoneCaptureStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastMicrophoneCaptureStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the state of app broadcast microphone capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastmicrophonecapturestatechangedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the error code associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastmicrophonecapturestatechangedeventargs.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
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
    get_State() {
        if (!this.HasProp("__IAppBroadcastMicrophoneCaptureStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastMicrophoneCaptureStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastMicrophoneCaptureStateChangedEventArgs := IAppBroadcastMicrophoneCaptureStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastMicrophoneCaptureStateChangedEventArgs.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAppBroadcastMicrophoneCaptureStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastMicrophoneCaptureStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastMicrophoneCaptureStateChangedEventArgs := IAppBroadcastMicrophoneCaptureStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastMicrophoneCaptureStateChangedEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
