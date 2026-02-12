#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HttpMediaTypeWithQualityHeaderValueCollection.ahk
#Include .\HttpContentCodingWithQualityHeaderValueCollection.ahk
#Include .\HttpLanguageRangeWithQualityHeaderValueCollection.ahk
#Include .\HttpCredentialsHeaderValue.ahk
#Include .\HttpCacheDirectiveHeaderValueCollection.ahk
#Include .\HttpConnectionOptionHeaderValueCollection.ahk
#Include .\HttpCookiePairHeaderValueCollection.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpExpectationHeaderValueCollection.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Networking\HostName.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include .\HttpTransferCodingHeaderValueCollection.ahk
#Include .\HttpProductInfoHeaderValueCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpRequestHeaderCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpRequestHeaderCollection
     * @type {Guid}
     */
    static IID => Guid("{af40329b-b544-469b-86b9-ac3d466fea36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Accept", "get_AcceptEncoding", "get_AcceptLanguage", "get_Authorization", "put_Authorization", "get_CacheControl", "get_Connection", "get_Cookie", "get_Date", "put_Date", "get_Expect", "get_From", "put_From", "get_Host", "put_Host", "get_IfModifiedSince", "put_IfModifiedSince", "get_IfUnmodifiedSince", "put_IfUnmodifiedSince", "get_MaxForwards", "put_MaxForwards", "get_ProxyAuthorization", "put_ProxyAuthorization", "get_Referer", "put_Referer", "get_TransferEncoding", "get_UserAgent", "Append", "TryAppendWithoutValidation"]

    /**
     * @type {HttpMediaTypeWithQualityHeaderValueCollection} 
     */
    Accept {
        get => this.get_Accept()
    }

    /**
     * @type {HttpContentCodingWithQualityHeaderValueCollection} 
     */
    AcceptEncoding {
        get => this.get_AcceptEncoding()
    }

    /**
     * @type {HttpLanguageRangeWithQualityHeaderValueCollection} 
     */
    AcceptLanguage {
        get => this.get_AcceptLanguage()
    }

    /**
     * @type {HttpCredentialsHeaderValue} 
     */
    Authorization {
        get => this.get_Authorization()
        set => this.put_Authorization(value)
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
     * @type {HttpCookiePairHeaderValueCollection} 
     */
    Cookie {
        get => this.get_Cookie()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * @type {HttpExpectationHeaderValueCollection} 
     */
    Expect {
        get => this.get_Expect()
    }

    /**
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * @type {HostName} 
     */
    Host {
        get => this.get_Host()
        set => this.put_Host(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    IfModifiedSince {
        get => this.get_IfModifiedSince()
        set => this.put_IfModifiedSince(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    IfUnmodifiedSince {
        get => this.get_IfUnmodifiedSince()
        set => this.put_IfUnmodifiedSince(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxForwards {
        get => this.get_MaxForwards()
        set => this.put_MaxForwards(value)
    }

    /**
     * @type {HttpCredentialsHeaderValue} 
     */
    ProxyAuthorization {
        get => this.get_ProxyAuthorization()
        set => this.put_ProxyAuthorization(value)
    }

    /**
     * @type {Uri} 
     */
    Referer {
        get => this.get_Referer()
        set => this.put_Referer(value)
    }

    /**
     * @type {HttpTransferCodingHeaderValueCollection} 
     */
    TransferEncoding {
        get => this.get_TransferEncoding()
    }

    /**
     * @type {HttpProductInfoHeaderValueCollection} 
     */
    UserAgent {
        get => this.get_UserAgent()
    }

    /**
     * 
     * @returns {HttpMediaTypeWithQualityHeaderValueCollection} 
     */
    get_Accept() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMediaTypeWithQualityHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpContentCodingWithQualityHeaderValueCollection} 
     */
    get_AcceptEncoding() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentCodingWithQualityHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpLanguageRangeWithQualityHeaderValueCollection} 
     */
    get_AcceptLanguage() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpLanguageRangeWithQualityHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpCredentialsHeaderValue} 
     */
    get_Authorization() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCredentialsHeaderValue(value)
    }

    /**
     * 
     * @param {HttpCredentialsHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_Authorization(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpCacheDirectiveHeaderValueCollection} 
     */
    get_CacheControl() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
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
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpConnectionOptionHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpCookiePairHeaderValueCollection} 
     */
    get_Cookie() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCookiePairHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Date() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
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
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpExpectationHeaderValueCollection} 
     */
    get_Expect() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpExpectationHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
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
    put_From(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_Host() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_Host(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_IfModifiedSince() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
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
    put_IfModifiedSince(value) {
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_IfUnmodifiedSince() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
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
    put_IfUnmodifiedSince(value) {
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxForwards() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxForwards(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpCredentialsHeaderValue} 
     */
    get_ProxyAuthorization() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCredentialsHeaderValue(value)
    }

    /**
     * 
     * @param {HttpCredentialsHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_ProxyAuthorization(value) {
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Referer() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
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
    put_Referer(value) {
        result := ComCall(30, this, "ptr", value, "int")
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
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpTransferCodingHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpProductInfoHeaderValueCollection} 
     */
    get_UserAgent() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpProductInfoHeaderValueCollection(value)
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

        result := ComCall(33, this, "ptr", name, "ptr", value, "int")
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

        result := ComCall(34, this, "ptr", name, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
