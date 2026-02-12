#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureState.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppCaptureState.ahk
#Include .\AppCaptureMicrophoneCaptureStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the state of app capture.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturestate
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the app capture target is currently running.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturestate.istargetrunning
     * @type {Boolean} 
     */
    IsTargetRunning {
        get => this.get_IsTargetRunning()
    }

    /**
     * Gets a value specifying whether historical app capture is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturestate.ishistoricalcaptureenabled
     * @type {Boolean} 
     */
    IsHistoricalCaptureEnabled {
        get => this.get_IsHistoricalCaptureEnabled()
    }

    /**
     * Gets a value specifying whether the microphone should be captured.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturestate.shouldcapturemicrophone
     * @type {Boolean} 
     */
    ShouldCaptureMicrophone {
        get => this.get_ShouldCaptureMicrophone()
        set => this.put_ShouldCaptureMicrophone(value)
    }

    /**
     * Gets the current microphone capture state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturestate.microphonecapturestate
     * @type {Integer} 
     */
    MicrophoneCaptureState {
        get => this.get_MicrophoneCaptureState()
    }

    /**
     * Gets an error code associated with microphone capture for app capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturestate.microphonecaptureerror
     * @type {Integer} 
     */
    MicrophoneCaptureError {
        get => this.get_MicrophoneCaptureError()
    }

    /**
     * Occurs when the state of microphone capture for app capture changes.
     * @type {TypedEventHandler<AppCaptureState, AppCaptureMicrophoneCaptureStateChangedEventArgs>}
    */
    OnMicrophoneCaptureStateChanged {
        get {
            if(!this.HasProp("__OnMicrophoneCaptureStateChanged")){
                this.__OnMicrophoneCaptureStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0b28a1a3-372e-50e9-a613-37b97cfd7a68}"),
                    AppCaptureState,
                    AppCaptureMicrophoneCaptureStateChangedEventArgs
                )
                this.__OnMicrophoneCaptureStateChangedToken := this.add_MicrophoneCaptureStateChanged(this.__OnMicrophoneCaptureStateChanged.iface)
            }
            return this.__OnMicrophoneCaptureStateChanged
        }
    }

    /**
     * Occurs when the capture target is closed.
     * @type {TypedEventHandler<AppCaptureState, IInspectable>}
    */
    OnCaptureTargetClosed {
        get {
            if(!this.HasProp("__OnCaptureTargetClosed")){
                this.__OnCaptureTargetClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b74ae481-777b-5bc9-83da-562d905a43f1}"),
                    AppCaptureState,
                    IInspectable
                )
                this.__OnCaptureTargetClosedToken := this.add_CaptureTargetClosed(this.__OnCaptureTargetClosed.iface)
            }
            return this.__OnCaptureTargetClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMicrophoneCaptureStateChangedToken")) {
            this.remove_MicrophoneCaptureStateChanged(this.__OnMicrophoneCaptureStateChangedToken)
            this.__OnMicrophoneCaptureStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCaptureTargetClosedToken")) {
            this.remove_CaptureTargetClosed(this.__OnCaptureTargetClosedToken)
            this.__OnCaptureTargetClosed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTargetRunning() {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.get_IsTargetRunning()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHistoricalCaptureEnabled() {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.get_IsHistoricalCaptureEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldCaptureMicrophone() {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.get_ShouldCaptureMicrophone()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldCaptureMicrophone(value) {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.put_ShouldCaptureMicrophone(value)
    }

    /**
     * Restarts microphone capture for app capture.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturestate.restartmicrophonecapture
     */
    RestartMicrophoneCapture() {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.RestartMicrophoneCapture()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MicrophoneCaptureState() {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.get_MicrophoneCaptureState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MicrophoneCaptureError() {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.get_MicrophoneCaptureError()
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureState, AppCaptureMicrophoneCaptureStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MicrophoneCaptureStateChanged(value) {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.add_MicrophoneCaptureStateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MicrophoneCaptureStateChanged(token) {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.remove_MicrophoneCaptureStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureState, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CaptureTargetClosed(value) {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.add_CaptureTargetClosed(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CaptureTargetClosed(token) {
        if (!this.HasProp("__IAppCaptureState")) {
            if ((queryResult := this.QueryInterface(IAppCaptureState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureState := IAppCaptureState(outPtr)
        }

        return this.__IAppCaptureState.remove_CaptureTargetClosed(token)
    }

;@endregion Instance Methods
}
