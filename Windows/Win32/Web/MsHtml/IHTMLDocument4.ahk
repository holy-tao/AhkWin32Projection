#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocument4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDocument4
     * @type {Guid}
     */
    static IID => Guid("{3050f69a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["focus", "hasFocus", "put_onselectionchange", "get_onselectionchange", "get_namespaces", "createDocumentFromUrl", "put_media", "get_media", "createEventObject", "fireEvent", "createRenderStyle", "put_oncontrolselect", "get_oncontrolselect", "get_URLUnencoded"]

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfFocus 
     * @returns {HRESULT} 
     */
    hasFocus(pfFocus) {
        result := ComCall(8, this, "ptr", pfFocus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselectionchange(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onselectionchange(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_namespaces(p) {
        result := ComCall(11, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bstrOptions 
     * @param {Pointer<IHTMLDocument2>} newDoc 
     * @returns {HRESULT} 
     */
    createDocumentFromUrl(bstrUrl, bstrOptions, newDoc) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrOptions := bstrOptions is String ? BSTR.Alloc(bstrOptions).Value : bstrOptions

        result := ComCall(12, this, "ptr", bstrUrl, "ptr", bstrOptions, "ptr*", newDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_media(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarEventObject 
     * @param {Pointer<IHTMLEventObj>} ppEventObj 
     * @returns {HRESULT} 
     */
    createEventObject(pvarEventObject, ppEventObj) {
        result := ComCall(15, this, "ptr", pvarEventObject, "ptr*", ppEventObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrEventName 
     * @param {Pointer<VARIANT>} pvarEventObject 
     * @param {Pointer<VARIANT_BOOL>} pfCancelled 
     * @returns {HRESULT} 
     */
    fireEvent(bstrEventName, pvarEventObject, pfCancelled) {
        bstrEventName := bstrEventName is String ? BSTR.Alloc(bstrEventName).Value : bstrEventName

        result := ComCall(16, this, "ptr", bstrEventName, "ptr", pvarEventObject, "ptr", pfCancelled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @param {Pointer<IHTMLRenderStyle>} ppIHTMLRenderStyle 
     * @returns {HRESULT} 
     */
    createRenderStyle(v, ppIHTMLRenderStyle) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "ptr*", ppIHTMLRenderStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncontrolselect(v) {
        result := ComCall(18, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_oncontrolselect(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_URLUnencoded(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }
}
