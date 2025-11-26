#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLNamespace extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLNamespace
     * @type {Guid}
     */
    static IID => Guid("{3050f6bb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLNamespace
     * @type {Guid}
     */
    static CLSID => Guid("{3050f6bc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_name", "get_urn", "get_tagNames", "get_readyState", "put_onreadystatechange", "get_onreadystatechange", "doImport", "attachEvent", "detachEvent"]

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {BSTR} 
     */
    urn {
        get => this.get_urn()
    }

    /**
     * @type {IDispatch} 
     */
    tagNames {
        get => this.get_tagNames()
    }

    /**
     * @type {VARIANT} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT} 
     */
    onreadystatechange {
        get => this.get_onreadystatechange()
        set => this.put_onreadystatechange(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_urn() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_tagNames() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_readyState() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrImplementationUrl 
     * @returns {HRESULT} 
     */
    doImport(bstrImplementationUrl) {
        bstrImplementationUrl := bstrImplementationUrl is String ? BSTR.Alloc(bstrImplementationUrl).Value : bstrImplementationUrl

        result := ComCall(13, this, "ptr", bstrImplementationUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {VARIANT_BOOL} 
     */
    attachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(14, this, "ptr", event, "ptr", pDisp, "short*", &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {HRESULT} 
     */
    detachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(15, this, "ptr", event, "ptr", pDisp, "HRESULT")
        return result
    }
}
