#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLStorage.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLWindow6 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLWindow6
     * @type {Guid}
     */
    static IID => Guid("{30510453-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_XDomainRequest", "get_XDomainRequest", "get_sessionStorage", "get_localStorage", "put_onhashchange", "get_onhashchange", "get_maxConnectionsPerServer", "postMessage", "toStaticHTML", "put_onmessage", "get_onmessage", "msWriteProfilerMark"]

    /**
     * @type {VARIANT} 
     */
    XDomainRequest {
        get => this.get_XDomainRequest()
        set => this.put_XDomainRequest(value)
    }

    /**
     * @type {IHTMLStorage} 
     */
    sessionStorage {
        get => this.get_sessionStorage()
    }

    /**
     * @type {IHTMLStorage} 
     */
    localStorage {
        get => this.get_localStorage()
    }

    /**
     * @type {VARIANT} 
     */
    onhashchange {
        get => this.get_onhashchange()
        set => this.put_onhashchange(value)
    }

    /**
     * @type {Integer} 
     */
    maxConnectionsPerServer {
        get => this.get_maxConnectionsPerServer()
    }

    /**
     * @type {VARIANT} 
     */
    onmessage {
        get => this.get_onmessage()
        set => this.put_onmessage(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_XDomainRequest(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_XDomainRequest() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStorage} 
     */
    get_sessionStorage() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStorage(p)
    }

    /**
     * 
     * @returns {IHTMLStorage} 
     */
    get_localStorage() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStorage(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhashchange(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhashchange() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_maxConnectionsPerServer() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} msg 
     * @param {VARIANT} targetOrigin 
     * @returns {HRESULT} 
     */
    postMessage(msg, targetOrigin) {
        msg := msg is String ? BSTR.Alloc(msg).Value : msg

        result := ComCall(14, this, "ptr", msg, "ptr", targetOrigin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHTML 
     * @returns {BSTR} 
     */
    toStaticHTML(bstrHTML) {
        bstrHTML := bstrHTML is String ? BSTR.Alloc(bstrHTML).Value : bstrHTML

        pbstrStaticHTML := BSTR()
        result := ComCall(15, this, "ptr", bstrHTML, "ptr", pbstrStaticHTML, "HRESULT")
        return pbstrStaticHTML
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmessage(v) {
        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmessage() {
        p := VARIANT()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrProfilerMarkName 
     * @returns {HRESULT} 
     */
    msWriteProfilerMark(bstrProfilerMarkName) {
        bstrProfilerMarkName := bstrProfilerMarkName is String ? BSTR.Alloc(bstrProfilerMarkName).Value : bstrProfilerMarkName

        result := ComCall(18, this, "ptr", bstrProfilerMarkName, "HRESULT")
        return result
    }
}
