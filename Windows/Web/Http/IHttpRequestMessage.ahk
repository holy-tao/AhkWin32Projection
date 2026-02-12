#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IHttpContent.ahk
#Include Headers\HttpRequestHeaderCollection.ahk
#Include .\HttpMethod.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Uri.ahk
#Include .\HttpTransportInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpRequestMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpRequestMessage
     * @type {Guid}
     */
    static IID => Guid("{f5762b3c-74d4-4811-b5dc-9f8b4e2f9abf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "put_Content", "get_Headers", "get_Method", "put_Method", "get_Properties", "get_RequestUri", "put_RequestUri", "get_TransportInformation"]

    /**
     * @type {IHttpContent} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {HttpRequestHeaderCollection} 
     */
    Headers {
        get => this.get_Headers()
    }

    /**
     * @type {HttpMethod} 
     */
    Method {
        get => this.get_Method()
        set => this.put_Method(value)
    }

    /**
     * @type {IMap<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {Uri} 
     */
    RequestUri {
        get => this.get_RequestUri()
        set => this.put_RequestUri(value)
    }

    /**
     * @type {HttpTransportInformation} 
     */
    TransportInformation {
        get => this.get_TransportInformation()
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
     * @returns {HttpRequestHeaderCollection} 
     */
    get_Headers() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestHeaderCollection(value)
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Method() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }

    /**
     * 
     * @param {HttpMethod} value 
     * @returns {HRESULT} 
     */
    put_Method(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<HSTRING, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RequestUri() {
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
    put_RequestUri(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpTransportInformation} 
     */
    get_TransportInformation() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpTransportInformation(value)
    }
}
