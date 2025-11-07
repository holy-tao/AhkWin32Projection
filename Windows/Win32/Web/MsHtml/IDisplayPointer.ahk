#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILineInfo.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDisplayPointer extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveToPoint", "MoveUnit", "PositionMarkupPointer", "MoveToPointer", "SetPointerGravity", "GetPointerGravity", "SetDisplayGravity", "GetDisplayGravity", "IsPositioned", "Unposition", "IsEqualTo", "IsLeftOf", "IsRightOf", "IsAtBOL", "MoveToMarkupPointer", "ScrollIntoView", "GetLineInfo", "GetFlowElement", "QueryBreaks"]

    /**
     * 
     * @param {POINT} ptPoint 
     * @param {Integer} eCoordSystem 
     * @param {IHTMLElement} pElementContext 
     * @param {Integer} dwHitTestOptions 
     * @returns {Integer} 
     */
    MoveToPoint(ptPoint, eCoordSystem, pElementContext, dwHitTestOptions) {
        result := ComCall(3, this, "ptr", ptPoint, "int", eCoordSystem, "ptr", pElementContext, "uint", dwHitTestOptions, "uint*", &pdwHitTestResults := 0, "HRESULT")
        return pdwHitTestResults
    }

    /**
     * 
     * @param {Integer} eMoveUnit 
     * @param {Integer} lXPos 
     * @returns {HRESULT} 
     */
    MoveUnit(eMoveUnit, lXPos) {
        result := ComCall(4, this, "int", eMoveUnit, "int", lXPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pMarkupPointer 
     * @returns {HRESULT} 
     */
    PositionMarkupPointer(pMarkupPointer) {
        result := ComCall(5, this, "ptr", pMarkupPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {HRESULT} 
     */
    MoveToPointer(pDispPointer) {
        result := ComCall(6, this, "ptr", pDispPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eGravity 
     * @returns {HRESULT} 
     */
    SetPointerGravity(eGravity) {
        result := ComCall(7, this, "int", eGravity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPointerGravity() {
        result := ComCall(8, this, "int*", &peGravity := 0, "HRESULT")
        return peGravity
    }

    /**
     * 
     * @param {Integer} eGravity 
     * @returns {HRESULT} 
     */
    SetDisplayGravity(eGravity) {
        result := ComCall(9, this, "int", eGravity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDisplayGravity() {
        result := ComCall(10, this, "int*", &peGravity := 0, "HRESULT")
        return peGravity
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsPositioned() {
        result := ComCall(11, this, "int*", &pfPositioned := 0, "HRESULT")
        return pfPositioned
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unposition() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {BOOL} 
     */
    IsEqualTo(pDispPointer) {
        result := ComCall(13, this, "ptr", pDispPointer, "int*", &pfIsEqual := 0, "HRESULT")
        return pfIsEqual
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {BOOL} 
     */
    IsLeftOf(pDispPointer) {
        result := ComCall(14, this, "ptr", pDispPointer, "int*", &pfIsLeftOf := 0, "HRESULT")
        return pfIsLeftOf
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {BOOL} 
     */
    IsRightOf(pDispPointer) {
        result := ComCall(15, this, "ptr", pDispPointer, "int*", &pfIsRightOf := 0, "HRESULT")
        return pfIsRightOf
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsAtBOL() {
        result := ComCall(16, this, "int*", &pfBOL := 0, "HRESULT")
        return pfBOL
    }

    /**
     * 
     * @param {IMarkupPointer} pPointer 
     * @param {IDisplayPointer} pDispLineContext 
     * @returns {HRESULT} 
     */
    MoveToMarkupPointer(pPointer, pDispLineContext) {
        result := ComCall(17, this, "ptr", pPointer, "ptr", pDispLineContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ScrollIntoView() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ILineInfo} 
     */
    GetLineInfo() {
        result := ComCall(19, this, "ptr*", &ppLineInfo := 0, "HRESULT")
        return ILineInfo(ppLineInfo)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    GetFlowElement() {
        result := ComCall(20, this, "ptr*", &ppLayoutElement := 0, "HRESULT")
        return IHTMLElement(ppLayoutElement)
    }

    /**
     * 
     * @returns {Integer} 
     */
    QueryBreaks() {
        result := ComCall(21, this, "uint*", &pdwBreaks := 0, "HRESULT")
        return pdwBreaks
    }
}
