#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureMicrophoneCaptureStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppCaptureState.MicrophoneCaptureStateChanged](./appcapturestate_microphonecapturestatechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemicrophonecapturestatechangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureMicrophoneCaptureStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureMicrophoneCaptureStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureMicrophoneCaptureStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new state of microphone capture for app capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemicrophonecapturestatechangedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the error code associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemicrophonecapturestatechangedeventargs.errorcode
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
        if (!this.HasProp("__IAppCaptureMicrophoneCaptureStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMicrophoneCaptureStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMicrophoneCaptureStateChangedEventArgs := IAppCaptureMicrophoneCaptureStateChangedEventArgs(outPtr)
        }

        return this.__IAppCaptureMicrophoneCaptureStateChangedEventArgs.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAppCaptureMicrophoneCaptureStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMicrophoneCaptureStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMicrophoneCaptureStateChangedEventArgs := IAppCaptureMicrophoneCaptureStateChangedEventArgs(outPtr)
        }

        return this.__IAppCaptureMicrophoneCaptureStateChangedEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
