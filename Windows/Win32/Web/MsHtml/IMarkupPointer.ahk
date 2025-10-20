#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupPointer extends IUnknown{
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
     * 
     * @param {Pointer<IHTMLDocument2>} ppDoc 
     * @returns {HRESULT} 
     */
    OwningDoc(ppDoc) {
        result := ComCall(3, this, "ptr", ppDoc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pGravity 
     * @returns {HRESULT} 
     */
    Gravity(pGravity) {
        result := ComCall(4, this, "int*", pGravity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Gravity 
     * @returns {HRESULT} 
     */
    SetGravity(Gravity) {
        result := ComCall(5, this, "int", Gravity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCling 
     * @returns {HRESULT} 
     */
    Cling(pfCling) {
        result := ComCall(6, this, "ptr", pfCling, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fCLing 
     * @returns {HRESULT} 
     */
    SetCling(fCLing) {
        result := ComCall(7, this, "int", fCLing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unposition() {
        result := ComCall(8, this, "int")
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
        result := ComCall(9, this, "ptr", pfPositioned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupContainer>} ppContainer 
     * @returns {HRESULT} 
     */
    GetContainer(ppContainer) {
        result := ComCall(10, this, "ptr", ppContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} pElement 
     * @param {Integer} eAdj 
     * @returns {HRESULT} 
     */
    MoveAdjacentToElement(pElement, eAdj) {
        result := ComCall(11, this, "ptr", pElement, "int", eAdj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointer 
     * @returns {HRESULT} 
     */
    MoveToPointer(pPointer) {
        result := ComCall(12, this, "ptr", pPointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupContainer>} pContainer 
     * @param {BOOL} fAtStart 
     * @returns {HRESULT} 
     */
    MoveToContainer(pContainer, fAtStart) {
        result := ComCall(13, this, "ptr", pContainer, "int", fAtStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fMove 
     * @param {Pointer<Int32>} pContext 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @param {Pointer<Int32>} pcch 
     * @param {PWSTR} pchText 
     * @returns {HRESULT} 
     */
    Left(fMove, pContext, ppElement, pcch, pchText) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(14, this, "int", fMove, "int*", pContext, "ptr", ppElement, "int*", pcch, "ptr", pchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fMove 
     * @param {Pointer<Int32>} pContext 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @param {Pointer<Int32>} pcch 
     * @param {PWSTR} pchText 
     * @returns {HRESULT} 
     */
    Right(fMove, pContext, ppElement, pcch, pchText) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(15, this, "int", fMove, "int*", pContext, "ptr", ppElement, "int*", pcch, "ptr", pchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} ppElemCurrent 
     * @returns {HRESULT} 
     */
    CurrentScope(ppElemCurrent) {
        result := ComCall(16, this, "ptr", ppElemCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointerThat 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsLeftOf(pPointerThat, pfResult) {
        result := ComCall(17, this, "ptr", pPointerThat, "ptr", pfResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointerThat 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsLeftOfOrEqualTo(pPointerThat, pfResult) {
        result := ComCall(18, this, "ptr", pPointerThat, "ptr", pfResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointerThat 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsRightOf(pPointerThat, pfResult) {
        result := ComCall(19, this, "ptr", pPointerThat, "ptr", pfResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointerThat 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsRightOfOrEqualTo(pPointerThat, pfResult) {
        result := ComCall(20, this, "ptr", pPointerThat, "ptr", pfResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointerThat 
     * @param {Pointer<BOOL>} pfAreEqual 
     * @returns {HRESULT} 
     */
    IsEqualTo(pPointerThat, pfAreEqual) {
        result := ComCall(21, this, "ptr", pPointerThat, "ptr", pfAreEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} muAction 
     * @returns {HRESULT} 
     */
    MoveUnit(muAction) {
        result := ComCall(22, this, "int", muAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pchFindText 
     * @param {Integer} dwFlags 
     * @param {Pointer<IMarkupPointer>} pIEndMatch 
     * @param {Pointer<IMarkupPointer>} pIEndSearch 
     * @returns {HRESULT} 
     */
    FindText(pchFindText, dwFlags, pIEndMatch, pIEndSearch) {
        pchFindText := pchFindText is String ? StrPtr(pchFindText) : pchFindText

        result := ComCall(23, this, "ptr", pchFindText, "uint", dwFlags, "ptr", pIEndMatch, "ptr", pIEndSearch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
