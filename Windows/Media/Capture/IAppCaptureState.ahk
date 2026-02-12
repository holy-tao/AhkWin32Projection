#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureState extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureState
     * @type {Guid}
     */
    static IID => Guid("{73134372-d4eb-44ce-9538-465f506ac4ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTargetRunning", "get_IsHistoricalCaptureEnabled", "get_ShouldCaptureMicrophone", "put_ShouldCaptureMicrophone", "RestartMicrophoneCapture", "get_MicrophoneCaptureState", "get_MicrophoneCaptureError", "add_MicrophoneCaptureStateChanged", "remove_MicrophoneCaptureStateChanged", "add_CaptureTargetClosed", "remove_CaptureTargetClosed"]

    /**
     * @type {Boolean} 
     */
    IsTargetRunning {
        get => this.get_IsTargetRunning()
    }

    /**
     * @type {Boolean} 
     */
    IsHistoricalCaptureEnabled {
        get => this.get_IsHistoricalCaptureEnabled()
    }

    /**
     * @type {Boolean} 
     */
    ShouldCaptureMicrophone {
        get => this.get_ShouldCaptureMicrophone()
        set => this.put_ShouldCaptureMicrophone(value)
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
     * 
     * @returns {Boolean} 
     */
    get_IsTargetRunning() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHistoricalCaptureEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
     * @returns {Integer} 
     */
    get_MicrophoneCaptureState() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureState, AppCaptureMicrophoneCaptureStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MicrophoneCaptureStateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", value, "ptr", token, "int")
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

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureState, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CaptureTargetClosed(value) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", value, "ptr", token, "int")
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

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
