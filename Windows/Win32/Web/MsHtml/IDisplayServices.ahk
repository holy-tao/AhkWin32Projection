#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLCaret.ahk
#Include .\IHTMLElement.ahk
#Include .\IHTMLComputedStyle.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\IDisplayPointer.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\IMarkupPointer.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\COORD_SYSTEM.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class IDisplayServices extends IUnknown {

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
     * @returns {IDisplayPointer} 
     */
    CreateDisplayPointer() {
        result := ComCall(3, this, "ptr*", &ppDispPointer := 0, "HRESULT")
        return IDisplayPointer(ppDispPointer)
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @param {COORD_SYSTEM} eSource 
     * @param {COORD_SYSTEM} eDestination 
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
     * @param {COORD_SYSTEM} eSource 
     * @param {COORD_SYSTEM} eDestination 
     * @param {IHTMLElement} pIElement 
     * @returns {HRESULT} 
     */
    TransformPoint(pPoint, eSource, eDestination, pIElement) {
        result := ComCall(5, this, "ptr", pPoint, "int", eSource, "int", eDestination, "ptr", pIElement, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLCaret} 
     */
    GetCaret() {
        result := ComCall(6, this, "ptr*", &ppCaret := 0, "HRESULT")
        return IHTMLCaret(ppCaret)
    }

    /**
     * 
     * @param {IMarkupPointer} pPointer 
     * @returns {IHTMLComputedStyle} 
     */
    GetComputedStyle(pPointer) {
        result := ComCall(7, this, "ptr", pPointer, "ptr*", &ppComputedStyle := 0, "HRESULT")
        return IHTMLComputedStyle(ppComputedStyle)
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @param {RECT} _rect 
     * @returns {HRESULT} 
     */
    ScrollRectIntoView(pIElement, _rect) {
        result := ComCall(8, this, "ptr", pIElement, "ptr", _rect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @returns {BOOL} 
     */
    HasFlowLayout(pIElement) {
        result := ComCall(9, this, "ptr", pIElement, "int*", &pfHasFlowLayout := 0, "HRESULT")
        return pfHasFlowLayout
    }
}
