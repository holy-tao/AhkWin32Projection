#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMarkupPointer.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupPointer2 extends IMarkupPointer{
    /**
     * The interface identifier for IMarkupPointer2
     * @type {Guid}
     */
    static IID => Guid("{3050f675-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * 
     * @param {Pointer<BOOL>} pfAtBreak 
     * @returns {HRESULT} 
     */
    IsAtWordBreak(pfAtBreak) {
        result := ComCall(24, this, "ptr", pfAtBreak, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMP 
     * @returns {HRESULT} 
     */
    GetMarkupPosition(plMP) {
        result := ComCall(25, this, "int*", plMP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupContainer>} pContainer 
     * @param {Integer} lMP 
     * @returns {HRESULT} 
     */
    MoveToMarkupPosition(pContainer, lMP) {
        result := ComCall(26, this, "ptr", pContainer, "int", lMP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} muAction 
     * @param {Pointer<IMarkupPointer>} pIBoundary 
     * @returns {HRESULT} 
     */
    MoveUnitBounded(muAction, pIBoundary) {
        result := ComCall(27, this, "int", muAction, "ptr", pIBoundary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pRight 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsInsideURL(pRight, pfResult) {
        result := ComCall(28, this, "ptr", pRight, "ptr", pfResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} pIElement 
     * @param {BOOL} fAtStart 
     * @returns {HRESULT} 
     */
    MoveToContent(pIElement, fAtStart) {
        result := ComCall(29, this, "ptr", pIElement, "int", fAtStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
