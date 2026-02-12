#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HttpContentDispositionHeaderValue.ahk
#Include .\HttpContentCodingHeaderValueCollection.ahk
#Include .\HttpLanguageHeaderValueCollection.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include .\HttpContentRangeHeaderValue.ahk
#Include .\HttpMediaTypeHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpContentHeaderCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpContentHeaderCollection
     * @type {Guid}
     */
    static IID => Guid("{40612a44-47ae-4b7e-9124-69628b64aa18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentDisposition", "put_ContentDisposition", "get_ContentEncoding", "get_ContentLanguage", "get_ContentLength", "put_ContentLength", "get_ContentLocation", "put_ContentLocation", "get_ContentMD5", "put_ContentMD5", "get_ContentRange", "put_ContentRange", "get_ContentType", "put_ContentType", "get_Expires", "put_Expires", "get_LastModified", "put_LastModified", "Append", "TryAppendWithoutValidation"]

    /**
     * @type {HttpContentDispositionHeaderValue} 
     */
    ContentDisposition {
        get => this.get_ContentDisposition()
        set => this.put_ContentDisposition(value)
    }

    /**
     * @type {HttpContentCodingHeaderValueCollection} 
     */
    ContentEncoding {
        get => this.get_ContentEncoding()
    }

    /**
     * @type {HttpLanguageHeaderValueCollection} 
     */
    ContentLanguage {
        get => this.get_ContentLanguage()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ContentLength {
        get => this.get_ContentLength()
        set => this.put_ContentLength(value)
    }

    /**
     * @type {Uri} 
     */
    ContentLocation {
        get => this.get_ContentLocation()
        set => this.put_ContentLocation(value)
    }

    /**
     * @type {IBuffer} 
     */
    ContentMD5 {
        get => this.get_ContentMD5()
        set => this.put_ContentMD5(value)
    }

    /**
     * @type {HttpContentRangeHeaderValue} 
     */
    ContentRange {
        get => this.get_ContentRange()
        set => this.put_ContentRange(value)
    }

    /**
     * @type {HttpMediaTypeHeaderValue} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    Expires {
        get => this.get_Expires()
        set => this.put_Expires(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    LastModified {
        get => this.get_LastModified()
        set => this.put_LastModified(value)
    }

    /**
     * 
     * @returns {HttpContentDispositionHeaderValue} 
     */
    get_ContentDisposition() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentDispositionHeaderValue(value)
    }

    /**
     * 
     * @param {HttpContentDispositionHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_ContentDisposition(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpContentCodingHeaderValueCollection} 
     */
    get_ContentEncoding() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentCodingHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {HttpLanguageHeaderValueCollection} 
     */
    get_ContentLanguage() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpLanguageHeaderValueCollection(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ContentLength() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt64(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ContentLength(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentLocation() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
    put_ContentLocation(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ContentMD5() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_ContentMD5(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpContentRangeHeaderValue} 
     */
    get_ContentRange() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentRangeHeaderValue(value)
    }

    /**
     * 
     * @param {HttpContentRangeHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_ContentRange(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpMediaTypeHeaderValue} 
     */
    get_ContentType() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMediaTypeHeaderValue(value)
    }

    /**
     * 
     * @param {HttpMediaTypeHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_ContentType(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Expires() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
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
    put_Expires(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastModified() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
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
    put_LastModified(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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

        result := ComCall(24, this, "ptr", name, "ptr", value, "int")
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

        result := ComCall(25, this, "ptr", name, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
