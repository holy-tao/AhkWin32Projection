#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\WebViewDeferredPermissionRequest.ahk
#Include .\WebViewSettings.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebView4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebView4
     * @type {Guid}
     */
    static IID => Guid("{e28243bc-67f3-462a-b4e0-3bbf6c3dab0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExecutionMode", "get_DeferredPermissionRequests", "get_Settings", "add_UnsupportedUriSchemeIdentified", "remove_UnsupportedUriSchemeIdentified", "add_NewWindowRequested", "remove_NewWindowRequested", "add_PermissionRequested", "remove_PermissionRequested", "AddWebAllowedObject", "DeferredPermissionRequestById"]

    /**
     * @type {Integer} 
     */
    ExecutionMode {
        get => this.get_ExecutionMode()
    }

    /**
     * @type {IVector<WebViewDeferredPermissionRequest>} 
     */
    DeferredPermissionRequests {
        get => this.get_DeferredPermissionRequests()
    }

    /**
     * @type {WebViewSettings} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExecutionMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<WebViewDeferredPermissionRequest>} 
     */
    get_DeferredPermissionRequests() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(WebViewDeferredPermissionRequest, value)
    }

    /**
     * 
     * @returns {WebViewSettings} 
     */
    get_Settings() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebViewSettings(value)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewUnsupportedUriSchemeIdentifiedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnsupportedUriSchemeIdentified(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_UnsupportedUriSchemeIdentified(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNewWindowRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NewWindowRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_NewWindowRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewPermissionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PermissionRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_PermissionRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {IInspectable} pObject 
     * @returns {HRESULT} 
     */
    AddWebAllowedObject(name, pObject) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(15, this, "ptr", name, "ptr", pObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {WebViewDeferredPermissionRequest} 
     */
    DeferredPermissionRequestById(id) {
        result := ComCall(16, this, "uint", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebViewDeferredPermissionRequest(result_)
    }
}
