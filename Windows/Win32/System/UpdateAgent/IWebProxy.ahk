#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStringCollection.ahk" { IStringCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains the HTTP proxy settings.
 * @remarks
 * You can create an instance of this interface by using the WebProxy coclass. Use the Microsoft.Update.WebProxy program identifier to create the object.
 * 
 * <div class="alert"><b>Important</b>  This interface is not supported on Windows 10 and Windows Server 2016. To configure proxy settings on  these operating systems (including proxy settings for  Windows Update Agent), use the  <b>Proxy</b> page of the <b>Network &amp; Internet</b> section in <b>Settings</b>. You can optionally use a <a href="https://en.wikipedia.org/wiki/Proxy_auto-config">proxy auto-config script</a> to apply settings. If you configure proxy settings, be sure to allow access to the domains used by Windows Update listed in <a href="https://support.microsoft.com/help/3084568/">this article</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iwebproxy
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IWebProxy extends IDispatch {
    /**
     * The interface identifier for IWebProxy
     * @type {Guid}
     */
    static IID := Guid("{174c81fe-aecd-4dae-b8a0-2c6318dd86a8}")

    /**
     * The class identifier for WebProxy
     * @type {Guid}
     */
    static CLSID := Guid("{650503cf-9108-4ddc-a2ce-6c2341e1c582}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebProxy interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Address                  : IntPtr
        put_Address                  : IntPtr
        get_BypassList               : IntPtr
        put_BypassList               : IntPtr
        get_BypassProxyOnLocal       : IntPtr
        put_BypassProxyOnLocal       : IntPtr
        get_ReadOnly                 : IntPtr
        get_UserName                 : IntPtr
        put_UserName                 : IntPtr
        SetPassword                  : IntPtr
        PromptForCredentials         : IntPtr
        PromptForCredentialsFromHwnd : IntPtr
        get_AutoDetect               : IntPtr
        put_AutoDetect               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebProxy.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Gets and sets the address and the decimal port number of the proxy server. (Get)
     * @remarks
     * The value of the <b>Address</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * When <b>Address</b> is a null reference (for example, if you specified Nothing in Visual Basic), all the requests bypass the proxy. The requests connect directly to the destination host.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_address
     */
    get_Address() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the address and the decimal port number of the proxy server. (Put)
     * @remarks
     * The value of the <b>Address</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * When <b>Address</b> is a null reference (for example, if you specified Nothing in Visual Basic), all the requests bypass the proxy. The requests connect directly to the destination host.
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_address
     */
    put_Address(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a collection of addresses that do not use the proxy server. (Get)
     * @remarks
     * The value of the <b>BypassList</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_bypasslist
     */
    get_BypassList() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets and sets a collection of addresses that do not use the proxy server. (Put)
     * @remarks
     * The value of the <b>BypassList</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * @param {IStringCollection} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_bypasslist
     */
    put_BypassList(value) {
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a Boolean value that indicates whether local addresses bypass the proxy server. (Get)
     * @remarks
     * The value of the <b>BypassProxyOnLocal</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal
     */
    get_BypassProxyOnLocal() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether local addresses bypass the proxy server. (Put)
     * @remarks
     * The value of the <b>BypassProxyOnLocal</b> property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> property is set to <b>VARIANT_TRUE</b>.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_bypassproxyonlocal
     */
    put_BypassProxyOnLocal(value) {
        result := ComCall(12, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the WebProxy object is read-only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the user name to submit to the proxy server for authentication. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_username
     */
    get_UserName() {
        retval := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the user name to submit to the proxy server for authentication. (Put)
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_username
     */
    put_UserName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(15, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Sets the password to submit to the proxy server for authentication.
     * @param {BSTR} value The password to submit to the proxy server for authentication.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-setpassword
     */
    SetPassword(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(16, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Prompts the user for the password to use for proxy authentication.
     * @remarks
     * This method can be changed only by a user on the computer. This method can be accessed through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * 
     * If null is specified for the parent window (for example, if you specified Nothing in Visual Basic), the dialog box is displayed on the desktop.
     * @param {IUnknown} parentWindow The parent window of the dialog box in which the user enters the credentials.
     * @param {BSTR} title The title to use for the dialog box in which the user enters the credentials.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-promptforcredentials
     */
    PromptForCredentials(parentWindow, title) {
        title := title is String ? BSTR.Alloc(title).Value : title

        result := ComCall(17, this, "ptr", parentWindow, BSTR, title, "HRESULT")
        return result
    }

    /**
     * Prompts the user for a password to use for proxy authentication using the hWnd property of the parent window.
     * @remarks
     * This method can be changed only by a user on the computer. This method can be accessed through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * 
     * If null is specified for the parent window (for example, if you specified Nothing in Visual Basic), the dialog box is displayed on the desktop.
     * @param {HWND} parentWindow The parent window of the dialog box in which the user enters the credentials.
     * @param {BSTR} title The title to use for the dialog box in which the user enters the credentials.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-promptforcredentialsfromhwnd
     */
    PromptForCredentialsFromHwnd(parentWindow, title) {
        title := title is String ? BSTR.Alloc(title).Value : title

        result := ComCall(18, this, HWND, parentWindow, BSTR, title, "HRESULT")
        return result
    }

    /**
     * Gets and sets a Boolean value that indicates whether IWebProxy automatically detects proxy settings. (Get)
     * @remarks
     * The values of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_address">Address</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypasslist">BypassList</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal">BypassProxyOnLocal</a> properties are ignored if the value of the <b>AutoDetect</b> property is set to <b>VARIANT_TRUE</b>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-get_autodetect
     */
    get_AutoDetect() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether IWebProxy automatically detects proxy settings. (Put)
     * @remarks
     * The values of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_address">Address</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypasslist">BypassList</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal">BypassProxyOnLocal</a> properties are ignored if the value of the <b>AutoDetect</b> property is set to <b>VARIANT_TRUE</b>.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwebproxy-put_autodetect
     */
    put_AutoDetect(value) {
        result := ComCall(20, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebProxy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Address := CallbackCreate(GetMethod(implObj, "get_Address"), flags, 2)
        this.vtbl.put_Address := CallbackCreate(GetMethod(implObj, "put_Address"), flags, 2)
        this.vtbl.get_BypassList := CallbackCreate(GetMethod(implObj, "get_BypassList"), flags, 2)
        this.vtbl.put_BypassList := CallbackCreate(GetMethod(implObj, "put_BypassList"), flags, 2)
        this.vtbl.get_BypassProxyOnLocal := CallbackCreate(GetMethod(implObj, "get_BypassProxyOnLocal"), flags, 2)
        this.vtbl.put_BypassProxyOnLocal := CallbackCreate(GetMethod(implObj, "put_BypassProxyOnLocal"), flags, 2)
        this.vtbl.get_ReadOnly := CallbackCreate(GetMethod(implObj, "get_ReadOnly"), flags, 2)
        this.vtbl.get_UserName := CallbackCreate(GetMethod(implObj, "get_UserName"), flags, 2)
        this.vtbl.put_UserName := CallbackCreate(GetMethod(implObj, "put_UserName"), flags, 2)
        this.vtbl.SetPassword := CallbackCreate(GetMethod(implObj, "SetPassword"), flags, 2)
        this.vtbl.PromptForCredentials := CallbackCreate(GetMethod(implObj, "PromptForCredentials"), flags, 3)
        this.vtbl.PromptForCredentialsFromHwnd := CallbackCreate(GetMethod(implObj, "PromptForCredentialsFromHwnd"), flags, 3)
        this.vtbl.get_AutoDetect := CallbackCreate(GetMethod(implObj, "get_AutoDetect"), flags, 2)
        this.vtbl.put_AutoDetect := CallbackCreate(GetMethod(implObj, "put_AutoDetect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Address)
        CallbackFree(this.vtbl.put_Address)
        CallbackFree(this.vtbl.get_BypassList)
        CallbackFree(this.vtbl.put_BypassList)
        CallbackFree(this.vtbl.get_BypassProxyOnLocal)
        CallbackFree(this.vtbl.put_BypassProxyOnLocal)
        CallbackFree(this.vtbl.get_ReadOnly)
        CallbackFree(this.vtbl.get_UserName)
        CallbackFree(this.vtbl.put_UserName)
        CallbackFree(this.vtbl.SetPassword)
        CallbackFree(this.vtbl.PromptForCredentials)
        CallbackFree(this.vtbl.PromptForCredentialsFromHwnd)
        CallbackFree(this.vtbl.get_AutoDetect)
        CallbackFree(this.vtbl.put_AutoDetect)
    }
}
