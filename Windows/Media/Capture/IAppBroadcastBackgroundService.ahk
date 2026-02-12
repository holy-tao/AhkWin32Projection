#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastBackgroundServiceSignInInfo.ahk
#Include .\AppBroadcastBackgroundServiceStreamInfo.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastBackgroundService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastBackgroundService
     * @type {Guid}
     */
    static IID => Guid("{bad1e72a-fa94-46f9-95fc-d71511cda70b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PlugInState", "get_PlugInState", "put_SignInInfo", "get_SignInInfo", "put_StreamInfo", "get_StreamInfo", "get_AppId", "get_BroadcastTitle", "put_ViewerCount", "get_ViewerCount", "TerminateBroadcast", "add_HeartbeatRequested", "remove_HeartbeatRequested", "get_TitleId"]

    /**
     * @type {Integer} 
     */
    PlugInState {
        get => this.get_PlugInState()
        set => this.put_PlugInState(value)
    }

    /**
     * @type {AppBroadcastBackgroundServiceSignInInfo} 
     */
    SignInInfo {
        get => this.get_SignInInfo()
        set => this.put_SignInInfo(value)
    }

    /**
     * @type {AppBroadcastBackgroundServiceStreamInfo} 
     */
    StreamInfo {
        get => this.get_StreamInfo()
        set => this.put_StreamInfo(value)
    }

    /**
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * @type {HSTRING} 
     */
    BroadcastTitle {
        get => this.get_BroadcastTitle()
    }

    /**
     * @type {Integer} 
     */
    ViewerCount {
        get => this.get_ViewerCount()
        set => this.put_ViewerCount(value)
    }

    /**
     * @type {HSTRING} 
     */
    TitleId {
        get => this.get_TitleId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PlugInState(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlugInState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {AppBroadcastBackgroundServiceSignInInfo} value 
     * @returns {HRESULT} 
     */
    put_SignInInfo(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppBroadcastBackgroundServiceSignInInfo} 
     */
    get_SignInInfo() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastBackgroundServiceSignInInfo(value)
    }

    /**
     * 
     * @param {AppBroadcastBackgroundServiceStreamInfo} value 
     * @returns {HRESULT} 
     */
    put_StreamInfo(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppBroadcastBackgroundServiceStreamInfo} 
     */
    get_StreamInfo() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastBackgroundServiceStreamInfo(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppId() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BroadcastTitle() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ViewerCount(value) {
        result := ComCall(14, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewerCount() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} reason 
     * @param {Integer} providerSpecificReason 
     * @returns {HRESULT} 
     */
    TerminateBroadcast(reason, providerSpecificReason) {
        result := ComCall(16, this, "int", reason, "uint", providerSpecificReason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundService, AppBroadcastHeartbeatRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HeartbeatRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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
    remove_HeartbeatRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TitleId() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
