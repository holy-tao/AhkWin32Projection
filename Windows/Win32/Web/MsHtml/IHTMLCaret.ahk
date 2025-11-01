#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCaret extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCaret
     * @type {Guid}
     */
    static IID => Guid("{3050f604-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveCaretToPointer", "MoveCaretToPointerEx", "MoveMarkupPointerToCaret", "MoveDisplayPointerToCaret", "IsVisible", "Show", "Hide", "InsertText", "ScrollIntoView", "GetLocation", "GetCaretDirection", "SetCaretDirection"]

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @param {BOOL} fScrollIntoView 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    MoveCaretToPointer(pDispPointer, fScrollIntoView, eDir) {
        result := ComCall(3, this, "ptr", pDispPointer, "int", fScrollIntoView, "int", eDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @param {BOOL} fVisible 
     * @param {BOOL} fScrollIntoView 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    MoveCaretToPointerEx(pDispPointer, fVisible, fScrollIntoView, eDir) {
        result := ComCall(4, this, "ptr", pDispPointer, "int", fVisible, "int", fScrollIntoView, "int", eDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pIMarkupPointer 
     * @returns {HRESULT} 
     */
    MoveMarkupPointerToCaret(pIMarkupPointer) {
        result := ComCall(5, this, "ptr", pIMarkupPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {HRESULT} 
     */
    MoveDisplayPointerToCaret(pDispPointer) {
        result := ComCall(6, this, "ptr", pDispPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsVisible 
     * @returns {HRESULT} 
     */
    IsVisible(pIsVisible) {
        result := ComCall(7, this, "ptr", pIsVisible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fScrollIntoView 
     * @returns {HRESULT} 
     */
    Show(fScrollIntoView) {
        result := ComCall(8, this, "int", fScrollIntoView, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Hide() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pText 
     * @param {Integer} lLen 
     * @returns {HRESULT} 
     */
    InsertText(pText, lLen) {
        pText := pText is String ? StrPtr(pText) : pText

        result := ComCall(10, this, "ptr", pText, "int", lLen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ScrollIntoView() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {BOOL} fTranslate 
     * @returns {HRESULT} 
     */
    GetLocation(pPoint, fTranslate) {
        result := ComCall(12, this, "ptr", pPoint, "int", fTranslate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peDir 
     * @returns {HRESULT} 
     */
    GetCaretDirection(peDir) {
        peDirMarshal := peDir is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, peDirMarshal, peDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    SetCaretDirection(eDir) {
        result := ComCall(14, this, "int", eDir, "HRESULT")
        return result
    }
}
