#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEditServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLEditServices
     * @type {Guid}
     */
    static IID => Guid("{3050f663-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddDesigner", "RemoveDesigner", "GetSelectionServices", "MoveToSelectionAnchor", "MoveToSelectionEnd", "SelectRange"]

    /**
     * 
     * @param {IHTMLEditDesigner} pIDesigner 
     * @returns {HRESULT} 
     */
    AddDesigner(pIDesigner) {
        result := ComCall(3, this, "ptr", pIDesigner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLEditDesigner} pIDesigner 
     * @returns {HRESULT} 
     */
    RemoveDesigner(pIDesigner) {
        result := ComCall(4, this, "ptr", pIDesigner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupContainer} pIContainer 
     * @param {Pointer<ISelectionServices>} ppSelSvc 
     * @returns {HRESULT} 
     */
    GetSelectionServices(pIContainer, ppSelSvc) {
        result := ComCall(5, this, "ptr", pIContainer, "ptr*", ppSelSvc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pIStartAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionAnchor(pIStartAnchor) {
        result := ComCall(6, this, "ptr", pIStartAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pIEndAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionEnd(pIEndAnchor) {
        result := ComCall(7, this, "ptr", pIEndAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pStart 
     * @param {IMarkupPointer} pEnd 
     * @param {Integer} eType 
     * @returns {HRESULT} 
     */
    SelectRange(pStart, pEnd, eType) {
        result := ComCall(8, this, "ptr", pStart, "ptr", pEnd, "int", eType, "HRESULT")
        return result
    }
}
