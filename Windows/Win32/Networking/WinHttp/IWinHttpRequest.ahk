#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class IWinHttpRequest extends IDispatch{
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
     * 
     * @param {Integer} ProxySetting 
     * @param {VARIANT} ProxyServer 
     * @param {VARIANT} BypassList 
     * @returns {HRESULT} 
     */
    SetProxy(ProxySetting, ProxyServer, BypassList) {
        result := ComCall(7, this, "int", ProxySetting, "ptr", ProxyServer, "ptr", BypassList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} UserName 
     * @param {BSTR} Password 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetCredentials(UserName, Password, Flags) {
        UserName := UserName is String ? BSTR.Alloc(UserName).Value : UserName
        Password := Password is String ? BSTR.Alloc(Password).Value : Password

        result := ComCall(8, this, "ptr", UserName, "ptr", Password, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Method 
     * @param {BSTR} Url 
     * @param {VARIANT} Async 
     * @returns {HRESULT} 
     */
    Open(Method, Url, Async) {
        Method := Method is String ? BSTR.Alloc(Method).Value : Method
        Url := Url is String ? BSTR.Alloc(Url).Value : Url

        result := ComCall(9, this, "ptr", Method, "ptr", Url, "ptr", Async, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Header 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    SetRequestHeader(Header, Value) {
        Header := Header is String ? BSTR.Alloc(Header).Value : Header
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(10, this, "ptr", Header, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Header 
     * @param {Pointer<BSTR>} Value 
     * @returns {HRESULT} 
     */
    GetResponseHeader(Header, Value) {
        Header := Header is String ? BSTR.Alloc(Header).Value : Header

        result := ComCall(11, this, "ptr", Header, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Headers 
     * @returns {HRESULT} 
     */
    GetAllResponseHeaders(Headers) {
        result := ComCall(12, this, "ptr", Headers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Body 
     * @returns {HRESULT} 
     */
    Send(Body) {
        result := ComCall(13, this, "ptr", Body, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(14, this, "int*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Status 
     * @returns {HRESULT} 
     */
    get_StatusText(Status) {
        result := ComCall(15, this, "ptr", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Body 
     * @returns {HRESULT} 
     */
    get_ResponseText(Body) {
        result := ComCall(16, this, "ptr", Body, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Body 
     * @returns {HRESULT} 
     */
    get_ResponseBody(Body) {
        result := ComCall(17, this, "ptr", Body, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Body 
     * @returns {HRESULT} 
     */
    get_ResponseStream(Body) {
        result := ComCall(18, this, "ptr", Body, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Option 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    get_Option(Option, Value) {
        result := ComCall(19, this, "int", Option, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Option 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    put_Option(Option, Value) {
        result := ComCall(20, this, "int", Option, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Timeout 
     * @param {Pointer<VARIANT_BOOL>} Succeeded 
     * @returns {HRESULT} 
     */
    WaitForResponse(Timeout, Succeeded) {
        result := ComCall(21, this, "ptr", Timeout, "ptr", Succeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ResolveTimeout 
     * @param {Integer} ConnectTimeout 
     * @param {Integer} SendTimeout 
     * @param {Integer} ReceiveTimeout 
     * @returns {HRESULT} 
     */
    SetTimeouts(ResolveTimeout, ConnectTimeout, SendTimeout, ReceiveTimeout) {
        result := ComCall(23, this, "int", ResolveTimeout, "int", ConnectTimeout, "int", SendTimeout, "int", ReceiveTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ClientCertificate 
     * @returns {HRESULT} 
     */
    SetClientCertificate(ClientCertificate) {
        ClientCertificate := ClientCertificate is String ? BSTR.Alloc(ClientCertificate).Value : ClientCertificate

        result := ComCall(24, this, "ptr", ClientCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AutoLogonPolicy 
     * @returns {HRESULT} 
     */
    SetAutoLogonPolicy(AutoLogonPolicy) {
        result := ComCall(25, this, "int", AutoLogonPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
