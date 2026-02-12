#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpMethodHeaderValueCollection.ahk
#Include .\HttpCacheDirectiveHeaderValueCollection.ahk
#Include .\HttpConnectionOptionHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include .\HttpChallengeHeaderValueCollection.ahk
#Include .\HttpDateOrDeltaHeaderValue.ahk
#Include .\HttpTransferCodingHeaderValueCollection.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpResponseHeaderCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpResponseHeaderCollection
     * @type {Guid}
     */
    static IID => Guid("{7a990969-fa3f-41ed-aac6-bf957975c16b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Age", "put_Age", "get_Allow", "get_CacheControl", "get_Connection", "get_Date", "put_Date", "get_Location", "put_Location", "get_ProxyAuthenticate", "get_RetryAfter", "put_RetryAfter", "get_TransferEncoding", "get_WwwAuthenticate", "Append", "TryAppendWithoutValidation"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    Age {
        get => this.get_Age()
        set => this.put_Age(value)
    }

    /**
     * @type {HttpMethodHeaderValueCollection} 
     */
    Allow {
        get => this.get_Allow()
    }

    /**
     * @type {HttpCacheDirectiveHeaderValueCollection} 
     */
    CacheControl {
        get => this.get_CacheControl()
    }

    /**
     * @type {HttpConnectionOptionHeaderValueCollection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * @type {Uri} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * @type {HttpChallengeHeaderValueCollection} 
     */
    ProxyAuthenticate {
        get => this.get_ProxyAuthenticate()
    }

    /**
     * @type {HttpDateOrDeltaHeaderValue} 
     */
    RetryAfter {
        get => this.get_RetryAfter()
        set => this.put_RetryAfter(value)
    }

    /**
     * @type {HttpTransferCodingHeaderValueCollection} 
     */
    TransferEncoding {
        get => this.get_TransferEncoding()
    }

    /**
     * @type {HttpChallengeHeaderValueCollection} 
     */
    WwwAuthenticate {
        get => this.get_WwwAuthenticate()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Age() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Age(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpMethodHeaderValueCollection} 
     */
    get_Allow() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethodHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpCacheDirectiveHeaderValueCollection} 
     */
    get_CacheControl() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCacheDirectiveHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpConnectionOptionHeaderValueCollection} 
     */
    get_Connection() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpConnectionOptionHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Date() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Date(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Location() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpChallengeHeaderValueCollection} 
     */
    get_ProxyAuthenticate() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpChallengeHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpDateOrDeltaHeaderValue} 
     */
    get_RetryAfter() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpDateOrDeltaHeaderValue(value)
    }

    /**
     * 
     * @param {HttpDateOrDeltaHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_RetryAfter(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpTransferCodingHeaderValueCollection} 
     */
    get_TransferEncoding() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpTransferCodingHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpChallengeHeaderValueCollection} 
     */
    get_WwwAuthenticate() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpChallengeHeaderValueCollection(value)
    }

    /**
     * Append geometry-shader-output data to an existing stream.
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @returns {HRESULT} | Item                                                                                                                             | Description                                                                                                                                            |
     * |----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="StreamDataType"></span><span id="streamdatatype"></span><span id="STREAMDATATYPE"></span>**StreamDataType**<br/> | A data input description. This description must match the stream-object template parameter called [DataType](dx-graphics-hlsl-so-type.md).<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * None
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-so-append
     */
    Append(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(20, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @returns {Boolean} 
     */
    TryAppendWithoutValidation(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(21, this, "ptr", name, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
