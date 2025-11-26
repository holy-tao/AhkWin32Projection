#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IStringCollection.ahk
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
     * @type {BSTR} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * @type {IStringCollection} 
     */
    BypassList {
        get => this.get_BypassList()
        set => this.put_BypassList(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    BypassProxyOnLocal {
        get => this.get_BypassProxyOnLocal()
        set => this.put_BypassProxyOnLocal(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ReadOnly {
        get => this.get_ReadOnly()
    }

    /**
     * @type {BSTR} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoDetect {
        get => this.get_AutoDetect()
        set => this.put_AutoDetect(value)
    }

    /**
     * Gets and sets the address and the decimal port number of the proxy server.
     * @remarks
     * 
     * The value of the <b>Address</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * When <b>Address</b> is a null reference (for example, if you specified Nothing in Visual Basic), all the requests bypass the proxy. The requests connect directly to the destination host.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-get_address
     */
    get_Address() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the address and the decimal port number of the proxy server.
     * @remarks
     * 
     * The value of the <b>Address</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * When <b>Address</b> is a null reference (for example, if you specified Nothing in Visual Basic), all the requests bypass the proxy. The requests connect directly to the destination host.
     * 
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-put_address
     */
    put_Address(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a collection of addresses that do not use the proxy server.
     * @remarks
     * 
     * The value of the <b>BypassList</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * 
     * 
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-get_bypasslist
     */
    get_BypassList() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets and sets a collection of addresses that do not use the proxy server.
     * @remarks
     * 
     * The value of the <b>BypassList</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * 
     * 
     * @param {IStringCollection} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-put_bypasslist
     */
    put_BypassList(value) {
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a Boolean value that indicates whether local addresses bypass the proxy server.
     * @remarks
     * 
     * The value of the <b>BypassProxyOnLocal</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal
     */
    get_BypassProxyOnLocal() {
        result := ComCall(11, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether local addresses bypass the proxy server.
     * @remarks
     * 
     * The value of the <b>BypassProxyOnLocal</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * 
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-put_bypassproxyonlocal
     */
    put_BypassProxyOnLocal(value) {
        result := ComCall(12, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the WebProxy object is read-only.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(13, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the user name to submit to the proxy server for authentication.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-get_username
     */
    get_UserName() {
        retval := BSTR()
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the user name to submit to the proxy server for authentication.
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-put_username
     */
    put_UserName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(15, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Sets the password to submit to the proxy server for authentication.
     * @param {BSTR} value The password to submit to the proxy server for authentication.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-setpassword
     */
    SetPassword(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(16, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Prompts the user for the password to use for proxy authentication.
     * @param {IUnknown} parentWindow The parent window of the dialog box in which the user enters the credentials.
     * @param {BSTR} title The title to use for the dialog box in which the user enters the credentials.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-promptforcredentials
     */
    PromptForCredentials(parentWindow, title) {
        title := title is String ? BSTR.Alloc(title).Value : title

        result := ComCall(17, this, "ptr", parentWindow, "ptr", title, "HRESULT")
        return result
    }

    /**
     * Prompts the user for a password to use for proxy authentication using the hWnd property of the parent window.
     * @param {HWND} parentWindow The parent window of the dialog box in which the user enters the credentials.
     * @param {BSTR} title The title to use for the dialog box in which the user enters the credentials.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-promptforcredentialsfromhwnd
     */
    PromptForCredentialsFromHwnd(parentWindow, title) {
        parentWindow := parentWindow is Win32Handle ? NumGet(parentWindow, "ptr") : parentWindow
        title := title is String ? BSTR.Alloc(title).Value : title

        result := ComCall(18, this, "ptr", parentWindow, "ptr", title, "HRESULT")
        return result
    }

    /**
     * Gets and sets a Boolean value that indicates whether IWebProxy automatically detects proxy settings.
     * @remarks
     * 
     * The values of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_address">Address</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypasslist">BypassList</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal">BypassProxyOnLocal</a> properties are ignored if the value of the <b>AutoDetect</b> property is set to <b>VARIANT_TRUE</b>.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-get_autodetect
     */
    get_AutoDetect() {
        result := ComCall(19, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether IWebProxy automatically detects proxy settings.
     * @remarks
     * 
     * The values of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_address">Address</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypasslist">BypassList</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal">BypassProxyOnLocal</a> properties are ignored if the value of the <b>AutoDetect</b> property is set to <b>VARIANT_TRUE</b>.
     * 
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwebproxy-put_autodetect
     */
    put_AutoDetect(value) {
        result := ComCall(20, this, "short", value, "HRESULT")
        return result
    }
}
