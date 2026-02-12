#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastState.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppBroadcastState.ahk
#Include .\AppBroadcastViewerCountChangedEventArgs.ahk
#Include .\AppBroadcastMicrophoneCaptureStateChangedEventArgs.ahk
#Include .\AppBroadcastCameraCaptureStateChangedEventArgs.ahk
#Include .\AppBroadcastPlugInStateChangedEventArgs.ahk
#Include .\AppBroadcastStreamStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents and manages the state of an app broadcast.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating if the capture target is currently running.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.iscapturetargetrunning
     * @type {Boolean} 
     */
    IsCaptureTargetRunning {
        get => this.get_IsCaptureTargetRunning()
    }

    /**
     * Gets the viewer count of the app broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.viewercount
     * @type {Integer} 
     */
    ViewerCount {
        get => this.get_ViewerCount()
    }

    /**
     * Gets or sets a value specifying whether the microphone should be captured for the app broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.shouldcapturemicrophone
     * @type {Boolean} 
     */
    ShouldCaptureMicrophone {
        get => this.get_ShouldCaptureMicrophone()
        set => this.put_ShouldCaptureMicrophone(value)
    }

    /**
     * Gets or sets a value specifying whether the camera should be captured for the app broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.shouldcapturecamera
     * @type {Boolean} 
     */
    ShouldCaptureCamera {
        get => this.get_ShouldCaptureCamera()
        set => this.put_ShouldCaptureCamera(value)
    }

    /**
     * Gets the encoded video size of the app broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.encodedvideosize
     * @type {SIZE} 
     */
    EncodedVideoSize {
        get => this.get_EncodedVideoSize()
    }

    /**
     * Gets the microphone capture state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.microphonecapturestate
     * @type {Integer} 
     */
    MicrophoneCaptureState {
        get => this.get_MicrophoneCaptureState()
    }

    /**
     * Gets the microphone capture error associated with the app broadcast state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.microphonecaptureerror
     * @type {Integer} 
     */
    MicrophoneCaptureError {
        get => this.get_MicrophoneCaptureError()
    }

    /**
     * Gets the camera capture state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.cameracapturestate
     * @type {Integer} 
     */
    CameraCaptureState {
        get => this.get_CameraCaptureState()
    }

    /**
     * Gets the camera capture error associated with the app broadcast state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.cameracaptureerror
     * @type {Integer} 
     */
    CameraCaptureError {
        get => this.get_CameraCaptureError()
    }

    /**
     * Gets a value specifying the state of the app broadcast stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.streamstate
     * @type {Integer} 
     */
    StreamState {
        get => this.get_StreamState()
    }

    /**
     * Gets the state of the plugin associated with the app broadcast state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.pluginstate
     * @type {Integer} 
     */
    PlugInState {
        get => this.get_PlugInState()
    }

    /**
     * Gets the OAuth request URI associated with the app broadcast state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.oauthrequesturi
     * @type {Uri} 
     */
    OAuthRequestUri {
        get => this.get_OAuthRequestUri()
    }

    /**
     * Gets the OAuth callback URI associated with the app broadcast state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.oauthcallbackuri
     * @type {Uri} 
     */
    OAuthCallbackUri {
        get => this.get_OAuthCallbackUri()
    }

    /**
     * Gets the authentication result of the app broadcast state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.authenticationresult
     * @type {WebAuthenticationResult} 
     */
    AuthenticationResult {
        get => this.get_AuthenticationResult()
        set => this.put_AuthenticationResult(value)
    }

    /**
     * Gets or sets a value specifying the sign-in state of the app broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.signinstate
     * @type {Integer} 
     */
    SignInState {
        get => this.get_SignInState()
        set => this.put_SignInState(value)
    }

    /**
     * Gets a value specifying the reason that the app broadcast was terminated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.terminationreason
     * @type {Integer} 
     */
    TerminationReason {
        get => this.get_TerminationReason()
    }

    /**
     * Gets a value indicating the plug-in-specified reason that app broadcast was terminated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.terminationreasonpluginspecific
     * @type {Integer} 
     */
    TerminationReasonPlugInSpecific {
        get => this.get_TerminationReasonPlugInSpecific()
    }

    /**
     * Occurs when the viewer count of the app broadcast changes.
     * @type {TypedEventHandler<AppBroadcastState, AppBroadcastViewerCountChangedEventArgs>}
    */
    OnViewerCountChanged {
        get {
            if(!this.HasProp("__OnViewerCountChanged")){
                this.__OnViewerCountChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{16a22a27-61c2-56c2-93e5-18d6681ceeb4}"),
                    AppBroadcastState,
                    AppBroadcastViewerCountChangedEventArgs
                )
                this.__OnViewerCountChangedToken := this.add_ViewerCountChanged(this.__OnViewerCountChanged.iface)
            }
            return this.__OnViewerCountChanged
        }
    }

    /**
     * Occurs when the microphone capture state changes.
     * @type {TypedEventHandler<AppBroadcastState, AppBroadcastMicrophoneCaptureStateChangedEventArgs>}
    */
    OnMicrophoneCaptureStateChanged {
        get {
            if(!this.HasProp("__OnMicrophoneCaptureStateChanged")){
                this.__OnMicrophoneCaptureStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f64d996a-3859-5174-97b1-e33d56dfca3a}"),
                    AppBroadcastState,
                    AppBroadcastMicrophoneCaptureStateChangedEventArgs
                )
                this.__OnMicrophoneCaptureStateChangedToken := this.add_MicrophoneCaptureStateChanged(this.__OnMicrophoneCaptureStateChanged.iface)
            }
            return this.__OnMicrophoneCaptureStateChanged
        }
    }

    /**
     * Occurs when the camera capture state changes.
     * @type {TypedEventHandler<AppBroadcastState, AppBroadcastCameraCaptureStateChangedEventArgs>}
    */
    OnCameraCaptureStateChanged {
        get {
            if(!this.HasProp("__OnCameraCaptureStateChanged")){
                this.__OnCameraCaptureStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b59aa695-b324-5b43-815b-8ffda6013816}"),
                    AppBroadcastState,
                    AppBroadcastCameraCaptureStateChangedEventArgs
                )
                this.__OnCameraCaptureStateChangedToken := this.add_CameraCaptureStateChanged(this.__OnCameraCaptureStateChanged.iface)
            }
            return this.__OnCameraCaptureStateChanged
        }
    }

    /**
     * Occurs when the state of the plugin associated with the app broadcast state changes.
     * @type {TypedEventHandler<AppBroadcastState, AppBroadcastPlugInStateChangedEventArgs>}
    */
    OnPlugInStateChanged {
        get {
            if(!this.HasProp("__OnPlugInStateChanged")){
                this.__OnPlugInStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{373d850e-045b-52a5-92da-c22f924b79fb}"),
                    AppBroadcastState,
                    AppBroadcastPlugInStateChangedEventArgs
                )
                this.__OnPlugInStateChangedToken := this.add_PlugInStateChanged(this.__OnPlugInStateChanged.iface)
            }
            return this.__OnPlugInStateChanged
        }
    }

    /**
     * Occurs when the stream state of the app broadcast changes.
     * @type {TypedEventHandler<AppBroadcastState, AppBroadcastStreamStateChangedEventArgs>}
    */
    OnStreamStateChanged {
        get {
            if(!this.HasProp("__OnStreamStateChanged")){
                this.__OnStreamStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2545fbd2-3fb6-5004-a475-56c059f3d75a}"),
                    AppBroadcastState,
                    AppBroadcastStreamStateChangedEventArgs
                )
                this.__OnStreamStateChangedToken := this.add_StreamStateChanged(this.__OnStreamStateChanged.iface)
            }
            return this.__OnStreamStateChanged
        }
    }

    /**
     * Occurs when the capture target is closed.
     * @type {TypedEventHandler<AppBroadcastState, IInspectable>}
    */
    OnCaptureTargetClosed {
        get {
            if(!this.HasProp("__OnCaptureTargetClosed")){
                this.__OnCaptureTargetClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a9b0513c-d638-5c5f-8051-791d7aa2d566}"),
                    AppBroadcastState,
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
        if(this.HasProp("__OnViewerCountChangedToken")) {
            this.remove_ViewerCountChanged(this.__OnViewerCountChangedToken)
            this.__OnViewerCountChanged.iface.Dispose()
        }

        if(this.HasProp("__OnMicrophoneCaptureStateChangedToken")) {
            this.remove_MicrophoneCaptureStateChanged(this.__OnMicrophoneCaptureStateChangedToken)
            this.__OnMicrophoneCaptureStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCameraCaptureStateChangedToken")) {
            this.remove_CameraCaptureStateChanged(this.__OnCameraCaptureStateChangedToken)
            this.__OnCameraCaptureStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPlugInStateChangedToken")) {
            this.remove_PlugInStateChanged(this.__OnPlugInStateChangedToken)
            this.__OnPlugInStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnStreamStateChangedToken")) {
            this.remove_StreamStateChanged(this.__OnStreamStateChangedToken)
            this.__OnStreamStateChanged.iface.Dispose()
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
    get_IsCaptureTargetRunning() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_IsCaptureTargetRunning()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewerCount() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_ViewerCount()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldCaptureMicrophone() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_ShouldCaptureMicrophone()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldCaptureMicrophone(value) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.put_ShouldCaptureMicrophone(value)
    }

    /**
     * Restarts microphone capture for the app broadcast.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.restartmicrophonecapture
     */
    RestartMicrophoneCapture() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.RestartMicrophoneCapture()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldCaptureCamera() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_ShouldCaptureCamera()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldCaptureCamera(value) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.put_ShouldCaptureCamera(value)
    }

    /**
     * Restarts camera capture for the app broadcast.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststate.restartcameracapture
     */
    RestartCameraCapture() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.RestartCameraCapture()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_EncodedVideoSize() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_EncodedVideoSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MicrophoneCaptureState() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_MicrophoneCaptureState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MicrophoneCaptureError() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_MicrophoneCaptureError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraCaptureState() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_CameraCaptureState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraCaptureError() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_CameraCaptureError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StreamState() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_StreamState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlugInState() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_PlugInState()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OAuthRequestUri() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_OAuthRequestUri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OAuthCallbackUri() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_OAuthCallbackUri()
    }

    /**
     * 
     * @returns {WebAuthenticationResult} 
     */
    get_AuthenticationResult() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_AuthenticationResult()
    }

    /**
     * 
     * @param {WebAuthenticationResult} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationResult(value) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.put_AuthenticationResult(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SignInState(value) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.put_SignInState(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignInState() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_SignInState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TerminationReason() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_TerminationReason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TerminationReasonPlugInSpecific() {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.get_TerminationReasonPlugInSpecific()
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastViewerCountChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ViewerCountChanged(value) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.add_ViewerCountChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ViewerCountChanged(token) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.remove_ViewerCountChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastMicrophoneCaptureStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MicrophoneCaptureStateChanged(value) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.add_MicrophoneCaptureStateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MicrophoneCaptureStateChanged(token) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.remove_MicrophoneCaptureStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastCameraCaptureStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CameraCaptureStateChanged(value) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.add_CameraCaptureStateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CameraCaptureStateChanged(token) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.remove_CameraCaptureStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastPlugInStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlugInStateChanged(handler) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.add_PlugInStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlugInStateChanged(token) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.remove_PlugInStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastStreamStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StreamStateChanged(handler) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.add_StreamStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StreamStateChanged(token) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.remove_StreamStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CaptureTargetClosed(value) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.add_CaptureTargetClosed(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CaptureTargetClosed(token) {
        if (!this.HasProp("__IAppBroadcastState")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastState := IAppBroadcastState(outPtr)
        }

        return this.__IAppBroadcastState.remove_CaptureTargetClosed(token)
    }

;@endregion Instance Methods
}
