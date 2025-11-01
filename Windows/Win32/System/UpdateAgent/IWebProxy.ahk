#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the HTTP proxy settings.
 * @remarks
 * 
  * You can create an instance of this interface by using the WebProxy coclass. Use the Microsoft.Update.WebProxy program identifier to create the object.
  * 
  * <div class="alert"><b>Important</b>  This interface is not supported on Windows 10 and Windows Server 2016. To configure proxy settings on  these operating systems (including proxy settings for  Windows Update Agent), use the  <b>Proxy</b> page of the <b>Network &amp; Internet</b> section in <b>Settings</b>. You can optionally use a <a href="https://en.wikipedia.org/wiki/Proxy_auto-config">proxy auto-config script</a> to apply settings. If you configure proxy settings, be sure to allow access to the domains used by Windows Update listed in <a href="https://support.microsoft.com/help/3084568/">this article</a>.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwebproxy
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWebProxy extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebProxy
     * @type {Guid}
     */
    static IID => Guid("{174c81fe-aecd-4dae-b8a0-2c6318dd86a8}")

    /**
     * The class identifier for WebProxy
     * @type {Guid}
     */
    static CLSID => Guid("{650503cf-9108-4ddc-a2ce-6c2341e1c582}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Address", "put_Address", "get_BypassList", "put_BypassList", "get_BypassProxyOnLocal", "put_BypassProxyOnLocal", "get_ReadOnly", "get_UserName", "put_UserName", "SetPassword", "PromptForCredentials", "PromptForCredentialsFromHwnd", "get_AutoDetect", "put_AutoDetect"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_address
     */
    get_Address(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_address
     */
    put_Address(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_bypasslist
     */
    get_BypassList(retval) {
        result := ComCall(9, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStringCollection} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_bypasslist
     */
    put_BypassList(value) {
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal
     */
    get_BypassProxyOnLocal(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_bypassproxyonlocal
     */
    put_BypassProxyOnLocal(value) {
        result := ComCall(12, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_readonly
     */
    get_ReadOnly(retval) {
        result := ComCall(13, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_username
     */
    get_UserName(retval) {
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_username
     */
    put_UserName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(15, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-setpassword
     */
    SetPassword(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(16, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} parentWindow 
     * @param {BSTR} title 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-promptforcredentials
     */
    PromptForCredentials(parentWindow, title) {
        title := title is String ? BSTR.Alloc(title).Value : title

        result := ComCall(17, this, "ptr", parentWindow, "ptr", title, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} parentWindow 
     * @param {BSTR} title 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-promptforcredentialsfromhwnd
     */
    PromptForCredentialsFromHwnd(parentWindow, title) {
        parentWindow := parentWindow is Win32Handle ? NumGet(parentWindow, "ptr") : parentWindow
        title := title is String ? BSTR.Alloc(title).Value : title

        result := ComCall(18, this, "ptr", parentWindow, "ptr", title, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_autodetect
     */
    get_AutoDetect(retval) {
        result := ComCall(19, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_autodetect
     */
    put_AutoDetect(value) {
        result := ComCall(20, this, "short", value, "HRESULT")
        return result
    }
}
