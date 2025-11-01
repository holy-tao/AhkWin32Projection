#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarkupServices
     * @type {Guid}
     */
    static IID => Guid("{3050f4a0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMarkupPointer", "CreateMarkupContainer", "CreateElement", "CloneElement", "InsertElement", "RemoveElement", "Remove", "Copy", "Move", "InsertText", "ParseString", "ParseGlobal", "IsScopedElement", "GetElementTagId", "GetTagIDForName", "GetNameForTagID", "MovePointersToRange", "MoveRangeToPointers", "BeginUndoUnit", "EndUndoUnit"]

    /**
     * 
     * @param {Pointer<IMarkupPointer>} ppPointer 
     * @returns {HRESULT} 
     */
    CreateMarkupPointer(ppPointer) {
        result := ComCall(3, this, "ptr*", ppPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupContainer>} ppMarkupContainer 
     * @returns {HRESULT} 
     */
    CreateMarkupContainer(ppMarkupContainer) {
        result := ComCall(4, this, "ptr*", ppMarkupContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tagID 
     * @param {PWSTR} pchAttributes 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @returns {HRESULT} 
     */
    CreateElement(tagID, pchAttributes, ppElement) {
        pchAttributes := pchAttributes is String ? StrPtr(pchAttributes) : pchAttributes

        result := ComCall(5, this, "int", tagID, "ptr", pchAttributes, "ptr*", ppElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pElemCloneThis 
     * @param {Pointer<IHTMLElement>} ppElementTheClone 
     * @returns {HRESULT} 
     */
    CloneElement(pElemCloneThis, ppElementTheClone) {
        result := ComCall(6, this, "ptr", pElemCloneThis, "ptr*", ppElementTheClone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pElementInsert 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    InsertElement(pElementInsert, pPointerStart, pPointerFinish) {
        result := ComCall(7, this, "ptr", pElementInsert, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pElementRemove 
     * @returns {HRESULT} 
     */
    RemoveElement(pElementRemove) {
        result := ComCall(8, this, "ptr", pElementRemove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    Remove(pPointerStart, pPointerFinish) {
        result := ComCall(9, this, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerSourceStart 
     * @param {IMarkupPointer} pPointerSourceFinish 
     * @param {IMarkupPointer} pPointerTarget 
     * @returns {HRESULT} 
     */
    Copy(pPointerSourceStart, pPointerSourceFinish, pPointerTarget) {
        result := ComCall(10, this, "ptr", pPointerSourceStart, "ptr", pPointerSourceFinish, "ptr", pPointerTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerSourceStart 
     * @param {IMarkupPointer} pPointerSourceFinish 
     * @param {IMarkupPointer} pPointerTarget 
     * @returns {HRESULT} 
     */
    Move(pPointerSourceStart, pPointerSourceFinish, pPointerTarget) {
        result := ComCall(11, this, "ptr", pPointerSourceStart, "ptr", pPointerSourceFinish, "ptr", pPointerTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @param {IMarkupPointer} pPointerTarget 
     * @returns {HRESULT} 
     */
    InsertText(pchText, cch, pPointerTarget) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(12, this, "ptr", pchText, "int", cch, "ptr", pPointerTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchHTML 
     * @param {Integer} dwFlags 
     * @param {Pointer<IMarkupContainer>} ppContainerResult 
     * @param {IMarkupPointer} ppPointerStart 
     * @param {IMarkupPointer} ppPointerFinish 
     * @returns {HRESULT} 
     */
    ParseString(pchHTML, dwFlags, ppContainerResult, ppPointerStart, ppPointerFinish) {
        pchHTML := pchHTML is String ? StrPtr(pchHTML) : pchHTML

        result := ComCall(13, this, "ptr", pchHTML, "uint", dwFlags, "ptr*", ppContainerResult, "ptr", ppPointerStart, "ptr", ppPointerFinish, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HGLOBAL} hglobalHTML 
     * @param {Integer} dwFlags 
     * @param {Pointer<IMarkupContainer>} ppContainerResult 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    ParseGlobal(hglobalHTML, dwFlags, ppContainerResult, pPointerStart, pPointerFinish) {
        hglobalHTML := hglobalHTML is Win32Handle ? NumGet(hglobalHTML, "ptr") : hglobalHTML

        result := ComCall(14, this, "ptr", hglobalHTML, "uint", dwFlags, "ptr*", ppContainerResult, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @param {Pointer<BOOL>} pfScoped 
     * @returns {HRESULT} 
     */
    IsScopedElement(pElement, pfScoped) {
        result := ComCall(15, this, "ptr", pElement, "ptr", pfScoped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @param {Pointer<Integer>} ptagId 
     * @returns {HRESULT} 
     */
    GetElementTagId(pElement, ptagId) {
        result := ComCall(16, this, "ptr", pElement, "int*", ptagId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<Integer>} ptagId 
     * @returns {HRESULT} 
     */
    GetTagIDForName(bstrName, ptagId) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(17, this, "ptr", bstrName, "int*", ptagId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tagId 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetNameForTagID(tagId, pbstrName) {
        result := ComCall(18, this, "int", tagId, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLTxtRange} pIRange 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    MovePointersToRange(pIRange, pPointerStart, pPointerFinish) {
        result := ComCall(19, this, "ptr", pIRange, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @param {IHTMLTxtRange} pIRange 
     * @returns {HRESULT} 
     */
    MoveRangeToPointers(pPointerStart, pPointerFinish, pIRange) {
        result := ComCall(20, this, "ptr", pPointerStart, "ptr", pPointerFinish, "ptr", pIRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchTitle 
     * @returns {HRESULT} 
     */
    BeginUndoUnit(pchTitle) {
        pchTitle := pchTitle is String ? StrPtr(pchTitle) : pchTitle

        result := ComCall(21, this, "ptr", pchTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndUndoUnit() {
        result := ComCall(22, this, "HRESULT")
        return result
    }
}
