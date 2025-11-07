#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMarkupPointer.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupPointer2 extends IMarkupPointer{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsAtWordBreak", "GetMarkupPosition", "MoveToMarkupPosition", "MoveUnitBounded", "IsInsideURL", "MoveToContent"]

    /**
     * 
     * @returns {BOOL} 
     */
    IsAtWordBreak() {
        result := ComCall(24, this, "int*", &pfAtBreak := 0, "HRESULT")
        return pfAtBreak
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMarkupPosition() {
        result := ComCall(25, this, "int*", &plMP := 0, "HRESULT")
        return plMP
    }

    /**
     * 
     * @param {IMarkupContainer} pContainer 
     * @param {Integer} lMP 
     * @returns {HRESULT} 
     */
    MoveToMarkupPosition(pContainer, lMP) {
        result := ComCall(26, this, "ptr", pContainer, "int", lMP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} muAction 
     * @param {IMarkupPointer} pIBoundary 
     * @returns {HRESULT} 
     */
    MoveUnitBounded(muAction, pIBoundary) {
        result := ComCall(27, this, "int", muAction, "ptr", pIBoundary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pRight 
     * @returns {BOOL} 
     */
    IsInsideURL(pRight) {
        result := ComCall(28, this, "ptr", pRight, "int*", &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @param {BOOL} fAtStart 
     * @returns {HRESULT} 
     */
    MoveToContent(pIElement, fAtStart) {
        result := ComCall(29, this, "ptr", pIElement, "int", fAtStart, "HRESULT")
        return result
    }
}
