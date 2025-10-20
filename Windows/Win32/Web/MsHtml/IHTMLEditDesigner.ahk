#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEditDesigner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLEditDesigner
     * @type {Guid}
     */
    static IID => Guid("{3050f662-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreHandleEvent", "PostHandleEvent", "TranslateAccelerator", "PostEditorEventNotify"]

    /**
     * 
     * @param {Integer} inEvtDispId 
     * @param {IHTMLEventObj} pIEventObj 
     * @returns {HRESULT} 
     */
    PreHandleEvent(inEvtDispId, pIEventObj) {
        result := ComCall(3, this, "int", inEvtDispId, "ptr", pIEventObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} inEvtDispId 
     * @param {IHTMLEventObj} pIEventObj 
     * @returns {HRESULT} 
     */
    PostHandleEvent(inEvtDispId, pIEventObj) {
        result := ComCall(4, this, "int", inEvtDispId, "ptr", pIEventObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} inEvtDispId 
     * @param {IHTMLEventObj} pIEventObj 
     * @returns {HRESULT} 
     */
    TranslateAccelerator(inEvtDispId, pIEventObj) {
        result := ComCall(5, this, "int", inEvtDispId, "ptr", pIEventObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} inEvtDispId 
     * @param {IHTMLEventObj} pIEventObj 
     * @returns {HRESULT} 
     */
    PostEditorEventNotify(inEvtDispId, pIEventObj) {
        result := ComCall(6, this, "int", inEvtDispId, "ptr", pIEventObj, "HRESULT")
        return result
    }
}
