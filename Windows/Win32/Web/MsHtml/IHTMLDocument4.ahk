#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLDocument2.ahk
#Include .\IHTMLEventObj.ahk
#Include .\IHTMLRenderStyle.ahk

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
     * @returns {VARIANT_BOOL} 
     */
    hasFocus() {
        result := ComCall(8, this, "short*", &pfFocus := 0, "HRESULT")
        return pfFocus
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
     * @returns {VARIANT} 
     */
    get_onselectionchange() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_namespaces() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bstrOptions 
     * @returns {IHTMLDocument2} 
     */
    createDocumentFromUrl(bstrUrl, bstrOptions) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrOptions := bstrOptions is String ? BSTR.Alloc(bstrOptions).Value : bstrOptions

        result := ComCall(12, this, "ptr", bstrUrl, "ptr", bstrOptions, "ptr*", &newDoc := 0, "HRESULT")
        return IHTMLDocument2(newDoc)
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
     * @returns {BSTR} 
     */
    get_media() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarEventObject 
     * @returns {IHTMLEventObj} 
     */
    createEventObject(pvarEventObject) {
        result := ComCall(15, this, "ptr", pvarEventObject, "ptr*", &ppEventObj := 0, "HRESULT")
        return IHTMLEventObj(ppEventObj)
    }

    /**
     * 
     * @param {BSTR} bstrEventName 
     * @param {Pointer<VARIANT>} pvarEventObject 
     * @returns {VARIANT_BOOL} 
     */
    fireEvent(bstrEventName, pvarEventObject) {
        bstrEventName := bstrEventName is String ? BSTR.Alloc(bstrEventName).Value : bstrEventName

        result := ComCall(16, this, "ptr", bstrEventName, "ptr", pvarEventObject, "short*", &pfCancelled := 0, "HRESULT")
        return pfCancelled
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLRenderStyle} 
     */
    createRenderStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "ptr*", &ppIHTMLRenderStyle := 0, "HRESULT")
        return IHTMLRenderStyle(ppIHTMLRenderStyle)
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
     * @returns {VARIANT} 
     */
    get_oncontrolselect() {
        p := VARIANT()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URLUnencoded() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }
}
