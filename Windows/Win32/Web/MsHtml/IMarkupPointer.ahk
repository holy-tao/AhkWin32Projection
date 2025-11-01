#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupPointer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarkupPointer
     * @type {Guid}
     */
    static IID => Guid("{3050f49f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OwningDoc", "Gravity", "SetGravity", "Cling", "SetCling", "Unposition", "IsPositioned", "GetContainer", "MoveAdjacentToElement", "MoveToPointer", "MoveToContainer", "Left", "Right", "CurrentScope", "IsLeftOf", "IsLeftOfOrEqualTo", "IsRightOf", "IsRightOfOrEqualTo", "IsEqualTo", "MoveUnit", "FindText"]

    /**
     * 
     * @param {Pointer<IHTMLDocument2>} ppDoc 
     * @returns {HRESULT} 
     */
    OwningDoc(ppDoc) {
        result := ComCall(3, this, "ptr*", ppDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pGravity 
     * @returns {HRESULT} 
     */
    Gravity(pGravity) {
        pGravityMarshal := pGravity is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pGravityMarshal, pGravity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Gravity 
     * @returns {HRESULT} 
     */
    SetGravity(Gravity) {
        result := ComCall(5, this, "int", Gravity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCling 
     * @returns {HRESULT} 
     */
    Cling(pfCling) {
        result := ComCall(6, this, "ptr", pfCling, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fCLing 
     * @returns {HRESULT} 
     */
    SetCling(fCLing) {
        result := ComCall(7, this, "int", fCLing, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unposition() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfPositioned 
     * @returns {HRESULT} 
     */
    IsPositioned(pfPositioned) {
        result := ComCall(9, this, "ptr", pfPositioned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupContainer>} ppContainer 
     * @returns {HRESULT} 
     */
    GetContainer(ppContainer) {
        result := ComCall(10, this, "ptr*", ppContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @param {Integer} eAdj 
     * @returns {HRESULT} 
     */
    MoveAdjacentToElement(pElement, eAdj) {
        result := ComCall(11, this, "ptr", pElement, "int", eAdj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointer 
     * @returns {HRESULT} 
     */
    MoveToPointer(pPointer) {
        result := ComCall(12, this, "ptr", pPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupContainer} pContainer 
     * @param {BOOL} fAtStart 
     * @returns {HRESULT} 
     */
    MoveToContainer(pContainer, fAtStart) {
        result := ComCall(13, this, "ptr", pContainer, "int", fAtStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fMove 
     * @param {Pointer<Integer>} pContext 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @param {Pointer<Integer>} pcch 
     * @param {PWSTR} pchText 
     * @returns {HRESULT} 
     */
    Left(fMove, pContext, ppElement, pcch, pchText) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        pContextMarshal := pContext is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "int", fMove, pContextMarshal, pContext, "ptr*", ppElement, pcchMarshal, pcch, "ptr", pchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fMove 
     * @param {Pointer<Integer>} pContext 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @param {Pointer<Integer>} pcch 
     * @param {PWSTR} pchText 
     * @returns {HRESULT} 
     */
    Right(fMove, pContext, ppElement, pcch, pchText) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        pContextMarshal := pContext is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "int", fMove, pContextMarshal, pContext, "ptr*", ppElement, pcchMarshal, pcch, "ptr", pchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} ppElemCurrent 
     * @returns {HRESULT} 
     */
    CurrentScope(ppElemCurrent) {
        result := ComCall(16, this, "ptr*", ppElemCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsLeftOf(pPointerThat, pfResult) {
        result := ComCall(17, this, "ptr", pPointerThat, "ptr", pfResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsLeftOfOrEqualTo(pPointerThat, pfResult) {
        result := ComCall(18, this, "ptr", pPointerThat, "ptr", pfResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsRightOf(pPointerThat, pfResult) {
        result := ComCall(19, this, "ptr", pPointerThat, "ptr", pfResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsRightOfOrEqualTo(pPointerThat, pfResult) {
        result := ComCall(20, this, "ptr", pPointerThat, "ptr", pfResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @param {Pointer<BOOL>} pfAreEqual 
     * @returns {HRESULT} 
     */
    IsEqualTo(pPointerThat, pfAreEqual) {
        result := ComCall(21, this, "ptr", pPointerThat, "ptr", pfAreEqual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} muAction 
     * @returns {HRESULT} 
     */
    MoveUnit(muAction) {
        result := ComCall(22, this, "int", muAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchFindText 
     * @param {Integer} dwFlags 
     * @param {IMarkupPointer} pIEndMatch 
     * @param {IMarkupPointer} pIEndSearch 
     * @returns {HRESULT} 
     */
    FindText(pchFindText, dwFlags, pIEndMatch, pIEndSearch) {
        pchFindText := pchFindText is String ? StrPtr(pchFindText) : pchFindText

        result := ComCall(23, this, "ptr", pchFindText, "uint", dwFlags, "ptr", pIEndMatch, "ptr", pIEndSearch, "HRESULT")
        return result
    }
}
