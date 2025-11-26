#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ILayoutRect extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILayoutRect
     * @type {Guid}
     */
    static IID => Guid("{3050f665-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_nextRect", "get_nextRect", "put_contentSrc", "get_contentSrc", "put_honorPageBreaks", "get_honorPageBreaks", "put_honorPageRules", "get_honorPageRules", "put_nextRectElement", "get_nextRectElement", "get_contentDocument"]

    /**
     * @type {BSTR} 
     */
    nextRect {
        get => this.get_nextRect()
        set => this.put_nextRect(value)
    }

    /**
     * @type {VARIANT} 
     */
    contentSrc {
        get => this.get_contentSrc()
        set => this.put_contentSrc(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    honorPageBreaks {
        get => this.get_honorPageBreaks()
        set => this.put_honorPageBreaks(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    honorPageRules {
        get => this.get_honorPageRules()
        set => this.put_honorPageRules(value)
    }

    /**
     * @type {IDispatch} 
     */
    nextRectElement {
        get => this.get_nextRectElement()
        set => this.put_nextRectElement(value)
    }

    /**
     * @type {IDispatch} 
     */
    contentDocument {
        get => this.get_contentDocument()
    }

    /**
     * 
     * @param {BSTR} bstrElementId 
     * @returns {HRESULT} 
     */
    put_nextRect(bstrElementId) {
        bstrElementId := bstrElementId is String ? BSTR.Alloc(bstrElementId).Value : bstrElementId

        result := ComCall(7, this, "ptr", bstrElementId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nextRect() {
        pbstrElementId := BSTR()
        result := ComCall(8, this, "ptr", pbstrElementId, "HRESULT")
        return pbstrElementId
    }

    /**
     * 
     * @param {VARIANT} varContentSrc 
     * @returns {HRESULT} 
     */
    put_contentSrc(varContentSrc) {
        result := ComCall(9, this, "ptr", varContentSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_contentSrc() {
        pvarContentSrc := VARIANT()
        result := ComCall(10, this, "ptr", pvarContentSrc, "HRESULT")
        return pvarContentSrc
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_honorPageBreaks(v) {
        result := ComCall(11, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_honorPageBreaks() {
        result := ComCall(12, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_honorPageRules(v) {
        result := ComCall(13, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_honorPageRules() {
        result := ComCall(14, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} pElem 
     * @returns {HRESULT} 
     */
    put_nextRectElement(pElem) {
        result := ComCall(15, this, "ptr", pElem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_nextRectElement() {
        result := ComCall(16, this, "ptr*", &ppElem := 0, "HRESULT")
        return IDispatch(ppElem)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_contentDocument() {
        result := ComCall(17, this, "ptr*", &pDoc := 0, "HRESULT")
        return IDispatch(pDoc)
    }
}
