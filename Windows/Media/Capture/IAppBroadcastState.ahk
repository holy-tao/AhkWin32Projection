#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Security\Authentication\Web\WebAuthenticationResult.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastState extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastState
     * @type {Guid}
     */
    static IID => Guid("{ee08056d-8099-4ddd-922e-c56dac58abfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCaptureTargetRunning", "get_ViewerCount", "get_ShouldCaptureMicrophone", "put_ShouldCaptureMicrophone", "RestartMicrophoneCapture", "get_ShouldCaptureCamera", "put_ShouldCaptureCamera", "RestartCameraCapture", "get_EncodedVideoSize", "get_MicrophoneCaptureState", "get_MicrophoneCaptureError", "get_CameraCaptureState", "get_CameraCaptureError", "get_StreamState", "get_PlugInState", "get_OAuthRequestUri", "get_OAuthCallbackUri", "get_AuthenticationResult", "put_AuthenticationResult", "put_SignInState", "get_SignInState", "get_TerminationReason", "get_TerminationReasonPlugInSpecific", "add_ViewerCountChanged", "remove_ViewerCountChanged", "add_MicrophoneCaptureStateChanged", "remove_MicrophoneCaptureStateChanged", "add_CameraCaptureStateChanged", "remove_CameraCaptureStateChanged", "add_PlugInStateChanged", "remove_PlugInStateChanged", "add_StreamStateChanged", "remove_StreamStateChanged", "add_CaptureTargetClosed", "remove_CaptureTargetClosed"]

    /**
     * @type {Boolean} 
     */
    IsCaptureTargetRunning {
        get => this.get_IsCaptureTargetRunning()
    }

    /**
     * @type {Integer} 
     */
    ViewerCount {
        get => this.get_ViewerCount()
    }

    /**
     * @type {Boolean} 
     */
    ShouldCaptureMicrophone {
        get => this.get_ShouldCaptureMicrophone()
        set => this.put_ShouldCaptureMicrophone(value)
    }

    /**
     * @type {Boolean} 
     */
    ShouldCaptureCamera {
        get => this.get_ShouldCaptureCamera()
        set => this.put_ShouldCaptureCamera(value)
    }

    /**
     * @type {SIZE} 
     */
    EncodedVideoSize {
        get => this.get_EncodedVideoSize()
    }

    /**
     * @type {Integer} 
     */
    MicrophoneCaptureState {
        get => this.get_MicrophoneCaptureState()
    }

    /**
     * @type {Integer} 
     */
    MicrophoneCaptureError {
        get => this.get_MicrophoneCaptureError()
    }

    /**
     * @type {Integer} 
     */
    CameraCaptureState {
        get => this.get_CameraCaptureState()
    }

    /**
     * @type {Integer} 
     */
    CameraCaptureError {
        get => this.get_CameraCaptureError()
    }

    /**
     * @type {Integer} 
     */
    StreamState {
        get => this.get_StreamState()
    }

    /**
     * @type {Integer} 
     */
    PlugInState {
        get => this.get_PlugInState()
    }

    /**
     * @type {Uri} 
     */
    OAuthRequestUri {
        get => this.get_OAuthRequestUri()
    }

    /**
     * @type {Uri} 
     */
    OAuthCallbackUri {
        get => this.get_OAuthCallbackUri()
    }

    /**
     * @type {WebAuthenticationResult} 
     */
    AuthenticationResult {
        get => this.get_AuthenticationResult()
        set => this.put_AuthenticationResult(value)
    }

    /**
     * @type {Integer} 
     */
    SignInState {
        get => this.get_SignInState()
        set => this.put_SignInState(value)
    }

    /**
     * @type {Integer} 
     */
    TerminationReason {
        get => this.get_TerminationReason()
    }

    /**
     * @type {Integer} 
     */
    TerminationReasonPlugInSpecific {
        get => this.get_TerminationReasonPlugInSpecific()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCaptureTargetRunning() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewerCount() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldCaptureMicrophone() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldCaptureMicrophone(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestartMicrophoneCapture() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldCaptureCamera() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldCaptureCamera(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestartCameraCapture() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_EncodedVideoSize() {
        value := SIZE()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MicrophoneCaptureState() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MicrophoneCaptureError() {
        result := ComCall(16, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraCaptureState() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraCaptureError() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StreamState() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlugInState() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OAuthRequestUri() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OAuthCallbackUri() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {WebAuthenticationResult} 
     */
    get_AuthenticationResult() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAuthenticationResult(value)
    }

    /**
     * 
     * @param {WebAuthenticationResult} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationResult(value) {
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SignInState(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignInState() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TerminationReason() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TerminationReasonPlugInSpecific() {
        result := ComCall(28, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastViewerCountChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ViewerCountChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ViewerCountChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastMicrophoneCaptureStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MicrophoneCaptureStateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(31, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MicrophoneCaptureStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(32, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastCameraCaptureStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CameraCaptureStateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(33, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CameraCaptureStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(34, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastPlugInStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlugInStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(35, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlugInStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(36, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, AppBroadcastStreamStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StreamStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StreamStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastState, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CaptureTargetClosed(value) {
        token := EventRegistrationToken()
        result := ComCall(39, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CaptureTargetClosed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(40, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
