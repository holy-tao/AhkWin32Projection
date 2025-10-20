#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<BSTR>} pbstrElementId 
     * @returns {HRESULT} 
     */
    get_nextRect(pbstrElementId) {
        result := ComCall(8, this, "ptr", pbstrElementId, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarContentSrc 
     * @returns {HRESULT} 
     */
    get_contentSrc(pvarContentSrc) {
        result := ComCall(10, this, "ptr", pvarContentSrc, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_honorPageBreaks(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_honorPageRules(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} ppElem 
     * @returns {HRESULT} 
     */
    get_nextRectElement(ppElem) {
        result := ComCall(16, this, "ptr*", ppElem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pDoc 
     * @returns {HRESULT} 
     */
    get_contentDocument(pDoc) {
        result := ComCall(17, this, "ptr*", pDoc, "HRESULT")
        return result
    }
}
