#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GameBarServicesTargetInfo.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppBroadcastServices.ahk
#Include .\AppCaptureServices.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IGameBarServices extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameBarServices
     * @type {Guid}
     */
    static IID => Guid("{2dbead57-50a6-499e-8c6c-d330a7311796}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetCapturePolicy", "EnableCapture", "DisableCapture", "get_TargetInfo", "get_SessionId", "get_AppBroadcastServices", "get_AppCaptureServices", "add_CommandReceived", "remove_CommandReceived"]

    /**
     * @type {Integer} 
     */
    TargetCapturePolicy {
        get => this.get_TargetCapturePolicy()
    }

    /**
     * @type {GameBarServicesTargetInfo} 
     */
    TargetInfo {
        get => this.get_TargetInfo()
    }

    /**
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * @type {AppBroadcastServices} 
     */
    AppBroadcastServices {
        get => this.get_AppBroadcastServices()
    }

    /**
     * @type {AppCaptureServices} 
     */
    AppCaptureServices {
        get => this.get_AppCaptureServices()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TargetCapturePolicy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableCapture() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableCapture() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {GameBarServicesTargetInfo} 
     */
    get_TargetInfo() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GameBarServicesTargetInfo(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionId() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppBroadcastServices} 
     */
    get_AppBroadcastServices() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastServices(value)
    }

    /**
     * 
     * @returns {AppCaptureServices} 
     */
    get_AppCaptureServices() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppCaptureServices(value)
    }

    /**
     * 
     * @param {TypedEventHandler<GameBarServices, GameBarServicesCommandEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CommandReceived(value) {
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
    remove_CommandReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
