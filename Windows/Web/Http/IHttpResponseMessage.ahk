#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IHttpContent.ahk
#Include Headers\HttpResponseHeaderCollection.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpRequestMessage.ahk
#Include .\HttpResponseMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpResponseMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpResponseMessage
     * @type {Guid}
     */
    static IID => Guid("{fee200fb-8664-44e0-95d9-42696199bffc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "put_Content", "get_Headers", "get_IsSuccessStatusCode", "get_ReasonPhrase", "put_ReasonPhrase", "get_RequestMessage", "put_RequestMessage", "get_Source", "put_Source", "get_StatusCode", "put_StatusCode", "get_Version", "put_Version", "EnsureSuccessStatusCode"]

    /**
     * @type {IHttpContent} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {HttpResponseHeaderCollection} 
     */
    Headers {
        get => this.get_Headers()
    }

    /**
     * @type {Boolean} 
     */
    IsSuccessStatusCode {
        get => this.get_IsSuccessStatusCode()
    }

    /**
     * @type {HSTRING} 
     */
    ReasonPhrase {
        get => this.get_ReasonPhrase()
        set => this.put_ReasonPhrase(value)
    }

    /**
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
        set => this.put_RequestMessage(value)
    }

    /**
     * @type {Integer} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
        set => this.put_StatusCode(value)
    }

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * 
     * @returns {IHttpContent} 
     */
    get_Content() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHttpContent(value)
    }

    /**
     * 
     * @param {IHttpContent} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpResponseHeaderCollection} 
     */
    get_Headers() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseHeaderCollection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuccessStatusCode() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ReasonPhrase() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ReasonPhrase(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestMessage(value)
    }

    /**
     * 
     * @param {HttpRequestMessage} value 
     * @returns {HRESULT} 
     */
    put_RequestMessage(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Source() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_Source(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_StatusCode(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_Version(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    EnsureSuccessStatusCode() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseMessage(result_)
    }
}
