#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDisplayServices extends IUnknown{
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
     * 
     * @param {Pointer<IDisplayPointer>} ppDispPointer 
     * @returns {HRESULT} 
     */
    CreateDisplayPointer(ppDispPointer) {
        result := ComCall(3, this, "ptr", ppDispPointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} eSource 
     * @param {Integer} eDestination 
     * @param {Pointer<IHTMLElement>} pIElement 
     * @returns {HRESULT} 
     */
    TransformRect(pRect, eSource, eDestination, pIElement) {
        result := ComCall(4, this, "ptr", pRect, "int", eSource, "int", eDestination, "ptr", pIElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {Integer} eSource 
     * @param {Integer} eDestination 
     * @param {Pointer<IHTMLElement>} pIElement 
     * @returns {HRESULT} 
     */
    TransformPoint(pPoint, eSource, eDestination, pIElement) {
        result := ComCall(5, this, "ptr", pPoint, "int", eSource, "int", eDestination, "ptr", pIElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLCaret>} ppCaret 
     * @returns {HRESULT} 
     */
    GetCaret(ppCaret) {
        result := ComCall(6, this, "ptr", ppCaret, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointer 
     * @param {Pointer<IHTMLComputedStyle>} ppComputedStyle 
     * @returns {HRESULT} 
     */
    GetComputedStyle(pPointer, ppComputedStyle) {
        result := ComCall(7, this, "ptr", pPointer, "ptr", ppComputedStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} pIElement 
     * @param {RECT} rect 
     * @returns {HRESULT} 
     */
    ScrollRectIntoView(pIElement, rect) {
        result := ComCall(8, this, "ptr", pIElement, "ptr", rect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} pIElement 
     * @param {Pointer<BOOL>} pfHasFlowLayout 
     * @returns {HRESULT} 
     */
    HasFlowLayout(pIElement, pfHasFlowLayout) {
        result := ComCall(9, this, "ptr", pIElement, "ptr", pfHasFlowLayout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
