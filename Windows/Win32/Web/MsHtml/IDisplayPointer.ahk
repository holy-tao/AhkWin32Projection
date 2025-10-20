#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDisplayPointer extends IUnknown{
    /**
     * The interface identifier for IDisplayPointer
     * @type {Guid}
     */
    static IID => Guid("{3050f69e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {POINT} ptPoint 
     * @param {Integer} eCoordSystem 
     * @param {Pointer<IHTMLElement>} pElementContext 
     * @param {Integer} dwHitTestOptions 
     * @param {Pointer<UInt32>} pdwHitTestResults 
     * @returns {HRESULT} 
     */
    MoveToPoint(ptPoint, eCoordSystem, pElementContext, dwHitTestOptions, pdwHitTestResults) {
        result := ComCall(3, this, "ptr", ptPoint, "int", eCoordSystem, "ptr", pElementContext, "uint", dwHitTestOptions, "uint*", pdwHitTestResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eMoveUnit 
     * @param {Integer} lXPos 
     * @returns {HRESULT} 
     */
    MoveUnit(eMoveUnit, lXPos) {
        result := ComCall(4, this, "int", eMoveUnit, "int", lXPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pMarkupPointer 
     * @returns {HRESULT} 
     */
    PositionMarkupPointer(pMarkupPointer) {
        result := ComCall(5, this, "ptr", pMarkupPointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDisplayPointer>} pDispPointer 
     * @returns {HRESULT} 
     */
    MoveToPointer(pDispPointer) {
        result := ComCall(6, this, "ptr", pDispPointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eGravity 
     * @returns {HRESULT} 
     */
    SetPointerGravity(eGravity) {
        result := ComCall(7, this, "int", eGravity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peGravity 
     * @returns {HRESULT} 
     */
    GetPointerGravity(peGravity) {
        result := ComCall(8, this, "int*", peGravity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eGravity 
     * @returns {HRESULT} 
     */
    SetDisplayGravity(eGravity) {
        result := ComCall(9, this, "int", eGravity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peGravity 
     * @returns {HRESULT} 
     */
    GetDisplayGravity(peGravity) {
        result := ComCall(10, this, "int*", peGravity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfPositioned 
     * @returns {HRESULT} 
     */
    IsPositioned(pfPositioned) {
        result := ComCall(11, this, "ptr", pfPositioned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unposition() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDisplayPointer>} pDispPointer 
     * @param {Pointer<BOOL>} pfIsEqual 
     * @returns {HRESULT} 
     */
    IsEqualTo(pDispPointer, pfIsEqual) {
        result := ComCall(13, this, "ptr", pDispPointer, "ptr", pfIsEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDisplayPointer>} pDispPointer 
     * @param {Pointer<BOOL>} pfIsLeftOf 
     * @returns {HRESULT} 
     */
    IsLeftOf(pDispPointer, pfIsLeftOf) {
        result := ComCall(14, this, "ptr", pDispPointer, "ptr", pfIsLeftOf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDisplayPointer>} pDispPointer 
     * @param {Pointer<BOOL>} pfIsRightOf 
     * @returns {HRESULT} 
     */
    IsRightOf(pDispPointer, pfIsRightOf) {
        result := ComCall(15, this, "ptr", pDispPointer, "ptr", pfIsRightOf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfBOL 
     * @returns {HRESULT} 
     */
    IsAtBOL(pfBOL) {
        result := ComCall(16, this, "ptr", pfBOL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointer 
     * @param {Pointer<IDisplayPointer>} pDispLineContext 
     * @returns {HRESULT} 
     */
    MoveToMarkupPointer(pPointer, pDispLineContext) {
        result := ComCall(17, this, "ptr", pPointer, "ptr", pDispLineContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ScrollIntoView() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ILineInfo>} ppLineInfo 
     * @returns {HRESULT} 
     */
    GetLineInfo(ppLineInfo) {
        result := ComCall(19, this, "ptr", ppLineInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} ppLayoutElement 
     * @returns {HRESULT} 
     */
    GetFlowElement(ppLayoutElement) {
        result := ComCall(20, this, "ptr", ppLayoutElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBreaks 
     * @returns {HRESULT} 
     */
    QueryBreaks(pdwBreaks) {
        result := ComCall(21, this, "uint*", pdwBreaks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
