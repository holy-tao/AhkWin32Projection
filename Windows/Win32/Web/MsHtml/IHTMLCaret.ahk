#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCaret extends IUnknown{
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
     * 
     * @param {Pointer<IDisplayPointer>} pDispPointer 
     * @param {BOOL} fScrollIntoView 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    MoveCaretToPointer(pDispPointer, fScrollIntoView, eDir) {
        result := ComCall(3, this, "ptr", pDispPointer, "int", fScrollIntoView, "int", eDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDisplayPointer>} pDispPointer 
     * @param {BOOL} fVisible 
     * @param {BOOL} fScrollIntoView 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    MoveCaretToPointerEx(pDispPointer, fVisible, fScrollIntoView, eDir) {
        result := ComCall(4, this, "ptr", pDispPointer, "int", fVisible, "int", fScrollIntoView, "int", eDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pIMarkupPointer 
     * @returns {HRESULT} 
     */
    MoveMarkupPointerToCaret(pIMarkupPointer) {
        result := ComCall(5, this, "ptr", pIMarkupPointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDisplayPointer>} pDispPointer 
     * @returns {HRESULT} 
     */
    MoveDisplayPointerToCaret(pDispPointer) {
        result := ComCall(6, this, "ptr", pDispPointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsVisible 
     * @returns {HRESULT} 
     */
    IsVisible(pIsVisible) {
        result := ComCall(7, this, "ptr", pIsVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fScrollIntoView 
     * @returns {HRESULT} 
     */
    Show(fScrollIntoView) {
        result := ComCall(8, this, "int", fScrollIntoView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Hide() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(10, this, "ptr", pText, "int", lLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ScrollIntoView() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {BOOL} fTranslate 
     * @returns {HRESULT} 
     */
    GetLocation(pPoint, fTranslate) {
        result := ComCall(12, this, "ptr", pPoint, "int", fTranslate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peDir 
     * @returns {HRESULT} 
     */
    GetCaretDirection(peDir) {
        result := ComCall(13, this, "int*", peDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    SetCaretDirection(eDir) {
        result := ComCall(14, this, "int", eDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
