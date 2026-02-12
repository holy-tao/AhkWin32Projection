#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureRecordingStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppCaptureRecordOperation.StateChanged](./appcapturerecordoperation_statechanged.md) event.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordingstatechangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureRecordingStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureRecordingStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureRecordingStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new state of the app capture recording operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordingstatechangedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the error code associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordingstatechangedeventargs.errorcode
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
        if (!this.HasProp("__IAppCaptureRecordingStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordingStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordingStateChangedEventArgs := IAppCaptureRecordingStateChangedEventArgs(outPtr)
        }

        return this.__IAppCaptureRecordingStateChangedEventArgs.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAppCaptureRecordingStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordingStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordingStateChangedEventArgs := IAppCaptureRecordingStateChangedEventArgs(outPtr)
        }

        return this.__IAppCaptureRecordingStateChangedEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
