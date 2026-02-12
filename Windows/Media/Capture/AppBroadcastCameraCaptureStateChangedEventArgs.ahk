#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastCameraCaptureStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppBroadcast.CameraCaptureStateChanged](./appbroadcaststate_cameracapturestatechanged.md) event.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastcameracapturestatechangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastCameraCaptureStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastCameraCaptureStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastCameraCaptureStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the new state of the app broadcast camera capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastcameracapturestatechangedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the error code associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastcameracapturestatechangedeventargs.errorcode
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
        if (!this.HasProp("__IAppBroadcastCameraCaptureStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastCameraCaptureStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastCameraCaptureStateChangedEventArgs := IAppBroadcastCameraCaptureStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastCameraCaptureStateChangedEventArgs.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAppBroadcastCameraCaptureStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastCameraCaptureStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastCameraCaptureStateChangedEventArgs := IAppBroadcastCameraCaptureStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastCameraCaptureStateChangedEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
