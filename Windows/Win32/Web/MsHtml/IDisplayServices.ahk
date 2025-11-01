#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDisplayServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayServices
     * @type {Guid}
     */
    static IID => Guid("{3050f69d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDisplayPointer", "TransformRect", "TransformPoint", "GetCaret", "GetComputedStyle", "ScrollRectIntoView", "HasFlowLayout"]

    /**
     * 
     * @param {Pointer<IDisplayPointer>} ppDispPointer 
     * @returns {HRESULT} 
     */
    CreateDisplayPointer(ppDispPointer) {
        result := ComCall(3, this, "ptr*", ppDispPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} eSource 
     * @param {Integer} eDestination 
     * @param {IHTMLElement} pIElement 
     * @returns {HRESULT} 
     */
    TransformRect(pRect, eSource, eDestination, pIElement) {
        result := ComCall(4, this, "ptr", pRect, "int", eSource, "int", eDestination, "ptr", pIElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {Integer} eSource 
     * @param {Integer} eDestination 
     * @param {IHTMLElement} pIElement 
     * @returns {HRESULT} 
     */
    TransformPoint(pPoint, eSource, eDestination, pIElement) {
        result := ComCall(5, this, "ptr", pPoint, "int", eSource, "int", eDestination, "ptr", pIElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLCaret>} ppCaret 
     * @returns {HRESULT} 
     */
    GetCaret(ppCaret) {
        result := ComCall(6, this, "ptr*", ppCaret, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointer 
     * @param {Pointer<IHTMLComputedStyle>} ppComputedStyle 
     * @returns {HRESULT} 
     */
    GetComputedStyle(pPointer, ppComputedStyle) {
        result := ComCall(7, this, "ptr", pPointer, "ptr*", ppComputedStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @param {RECT} rect 
     * @returns {HRESULT} 
     */
    ScrollRectIntoView(pIElement, rect) {
        result := ComCall(8, this, "ptr", pIElement, "ptr", rect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @param {Pointer<BOOL>} pfHasFlowLayout 
     * @returns {HRESULT} 
     */
    HasFlowLayout(pIElement, pfHasFlowLayout) {
        result := ComCall(9, this, "ptr", pIElement, "ptr", pfHasFlowLayout, "HRESULT")
        return result
    }
}
