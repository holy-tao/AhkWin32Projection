#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WebViewControl.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class IWebViewControlProcess extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlProcess
     * @type {Guid}
     */
    static IID => Guid("{02c723ec-98d6-424a-b63e-c6136c36a0f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProcessId", "get_EnterpriseId", "get_IsPrivateNetworkClientServerCapabilityEnabled", "CreateWebViewControlAsync", "GetWebViewControls", "Terminate", "add_ProcessExited", "remove_ProcessExited"]

    /**
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
    }

    /**
     * @type {Boolean} 
     */
    IsPrivateNetworkClientServerCapabilityEnabled {
        get => this.get_IsPrivateNetworkClientServerCapabilityEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrivateNetworkClientServerCapabilityEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} hostWindowHandle 
     * @param {RECT} bounds 
     * @returns {IAsyncOperation<WebViewControl>} 
     */
    CreateWebViewControlAsync(hostWindowHandle, bounds) {
        result := ComCall(9, this, "int64", hostWindowHandle, "ptr", bounds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebViewControl, operation)
    }

    /**
     * 
     * @returns {IVectorView<WebViewControl>} 
     */
    GetWebViewControls() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WebViewControl, result_)
    }

    /**
     * Eliminates the cache and ends asynchronous I/O with the DLL.
     * @returns {HRESULT} Returns <b>TRUE</b> if the function succeeds; otherwise, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nf-filehc-terminatecache
     */
    Terminate() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebViewControlProcess, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProcessExited(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_ProcessExited(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
