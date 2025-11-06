#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-interface
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class IWinHttpRequest extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinHttpRequest
     * @type {Guid}
     */
    static IID => Guid("{016fe2ec-b2c8-45f8-b23b-39e53a75396b}")

    /**
     * The class identifier for WinHttpRequest
     * @type {Guid}
     */
    static CLSID => Guid("{2087c2f4-2cef-4953-a8ab-66779b670495}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProxy", "SetCredentials", "Open", "SetRequestHeader", "GetResponseHeader", "GetAllResponseHeaders", "Send", "get_Status", "get_StatusText", "get_ResponseText", "get_ResponseBody", "get_ResponseStream", "get_Option", "put_Option", "WaitForResponse", "Abort", "SetTimeouts", "SetClientCertificate", "SetAutoLogonPolicy"]

    /**
     * 
     * @param {Integer} ProxySetting 
     * @param {VARIANT} ProxyServer 
     * @param {VARIANT} BypassList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setproxy
     */
    SetProxy(ProxySetting, ProxyServer, BypassList) {
        result := ComCall(7, this, "int", ProxySetting, "ptr", ProxyServer, "ptr", BypassList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} UserName 
     * @param {BSTR} Password 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setcredentials
     */
    SetCredentials(UserName, Password, Flags) {
        UserName := UserName is String ? BSTR.Alloc(UserName).Value : UserName
        Password := Password is String ? BSTR.Alloc(Password).Value : Password

        result := ComCall(8, this, "ptr", UserName, "ptr", Password, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Method 
     * @param {BSTR} Url 
     * @param {VARIANT} Async 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-open
     */
    Open(Method, Url, Async) {
        Method := Method is String ? BSTR.Alloc(Method).Value : Method
        Url := Url is String ? BSTR.Alloc(Url).Value : Url

        result := ComCall(9, this, "ptr", Method, "ptr", Url, "ptr", Async, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Header 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setrequestheader
     */
    SetRequestHeader(Header, Value) {
        Header := Header is String ? BSTR.Alloc(Header).Value : Header
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(10, this, "ptr", Header, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Header 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-getresponseheader
     */
    GetResponseHeader(Header) {
        Header := Header is String ? BSTR.Alloc(Header).Value : Header

        Value := BSTR()
        result := ComCall(11, this, "ptr", Header, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-getallresponseheaders
     */
    GetAllResponseHeaders() {
        Headers := BSTR()
        result := ComCall(12, this, "ptr", Headers, "HRESULT")
        return Headers
    }

    /**
     * 
     * @param {VARIANT} Body 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-send
     */
    Send(Body) {
        result := ComCall(13, this, "ptr", Body, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-status
     */
    get_Status() {
        result := ComCall(14, this, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-statustext
     */
    get_StatusText() {
        Status := BSTR()
        result := ComCall(15, this, "ptr", Status, "HRESULT")
        return Status
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-responsetext
     */
    get_ResponseText() {
        Body := BSTR()
        result := ComCall(16, this, "ptr", Body, "HRESULT")
        return Body
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-responsebody
     */
    get_ResponseBody() {
        Body := VARIANT()
        result := ComCall(17, this, "ptr", Body, "HRESULT")
        return Body
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-responsestream
     */
    get_ResponseStream() {
        Body := VARIANT()
        result := ComCall(18, this, "ptr", Body, "HRESULT")
        return Body
    }

    /**
     * 
     * @param {Integer} Option 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-option
     */
    get_Option(Option) {
        Value := VARIANT()
        result := ComCall(19, this, "int", Option, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {Integer} Option 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-option
     */
    put_Option(Option, Value) {
        result := ComCall(20, this, "int", Option, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Timeout 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-waitforresponse
     */
    WaitForResponse(Timeout) {
        result := ComCall(21, this, "ptr", Timeout, "short*", &Succeeded := 0, "HRESULT")
        return Succeeded
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-abort
     */
    Abort() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ResolveTimeout 
     * @param {Integer} ConnectTimeout 
     * @param {Integer} SendTimeout 
     * @param {Integer} ReceiveTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-settimeouts
     */
    SetTimeouts(ResolveTimeout, ConnectTimeout, SendTimeout, ReceiveTimeout) {
        result := ComCall(23, this, "int", ResolveTimeout, "int", ConnectTimeout, "int", SendTimeout, "int", ReceiveTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ClientCertificate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setclientcertificate
     */
    SetClientCertificate(ClientCertificate) {
        ClientCertificate := ClientCertificate is String ? BSTR.Alloc(ClientCertificate).Value : ClientCertificate

        result := ComCall(24, this, "ptr", ClientCertificate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AutoLogonPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setautologonpolicy
     */
    SetAutoLogonPolicy(AutoLogonPolicy) {
        result := ComCall(25, this, "int", AutoLogonPolicy, "HRESULT")
        return result
    }
}
