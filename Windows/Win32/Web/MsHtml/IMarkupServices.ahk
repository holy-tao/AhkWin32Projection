#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMarkupPointer.ahk
#Include .\IMarkupContainer.ahk
#Include .\IHTMLElement.ahk
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
     * @returns {IMarkupPointer} 
     */
    CreateMarkupPointer() {
        result := ComCall(3, this, "ptr*", &ppPointer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMarkupPointer(ppPointer)
    }

    /**
     * 
     * @returns {IMarkupContainer} 
     */
    CreateMarkupContainer() {
        result := ComCall(4, this, "ptr*", &ppMarkupContainer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMarkupContainer(ppMarkupContainer)
    }

    /**
     * 
     * @param {Integer} tagID 
     * @param {PWSTR} pchAttributes 
     * @returns {IHTMLElement} 
     */
    CreateElement(tagID, pchAttributes) {
        pchAttributes := pchAttributes is String ? StrPtr(pchAttributes) : pchAttributes

        result := ComCall(5, this, "int", tagID, "ptr", pchAttributes, "ptr*", &ppElement := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(ppElement)
    }

    /**
     * 
     * @param {IHTMLElement} pElemCloneThis 
     * @returns {IHTMLElement} 
     */
    CloneElement(pElemCloneThis) {
        result := ComCall(6, this, "ptr", pElemCloneThis, "ptr*", &ppElementTheClone := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(ppElementTheClone)
    }

    /**
     * 
     * @param {IHTMLElement} pElementInsert 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    InsertElement(pElementInsert, pPointerStart, pPointerFinish) {
        result := ComCall(7, this, "ptr", pElementInsert, "ptr", pPointerStart, "ptr", pPointerFinish, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IHTMLElement} pElementRemove 
     * @returns {HRESULT} 
     */
    RemoveElement(pElementRemove) {
        result := ComCall(8, this, "ptr", pElementRemove, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(pPointerStart, pPointerFinish) {
        result := ComCall(9, this, "ptr", pPointerStart, "ptr", pPointerFinish, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Describes the four steps to take to copy and paste a formula from one cell into another using CTRL+C and CTRL+V.
     * @param {IMarkupPointer} pPointerSourceStart 
     * @param {IMarkupPointer} pPointerSourceFinish 
     * @param {IMarkupPointer} pPointerTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/copy-and-paste-a-formula-from-one-cell-into-another
     */
    Copy(pPointerSourceStart, pPointerSourceFinish, pPointerTarget) {
        result := ComCall(10, this, "ptr", pPointerSourceStart, "ptr", pPointerSourceFinish, "ptr", pPointerTarget, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Move Method Example (VC++)
     * @param {IMarkupPointer} pPointerSourceStart 
     * @param {IMarkupPointer} pPointerSourceFinish 
     * @param {IMarkupPointer} pPointerTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/move-method-example-vc
     */
    Move(pPointerSourceStart, pPointerSourceFinish, pPointerTarget) {
        result := ComCall(11, this, "ptr", pPointerSourceStart, "ptr", pPointerSourceFinish, "ptr", pPointerTarget, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(12, this, "ptr", pchText, "int", cch, "ptr", pPointerTarget, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pchHTML 
     * @param {Integer} dwFlags 
     * @param {IMarkupPointer} ppPointerStart 
     * @param {IMarkupPointer} ppPointerFinish 
     * @returns {IMarkupContainer} 
     */
    ParseString(pchHTML, dwFlags, ppPointerStart, ppPointerFinish) {
        pchHTML := pchHTML is String ? StrPtr(pchHTML) : pchHTML

        result := ComCall(13, this, "ptr", pchHTML, "uint", dwFlags, "ptr*", &ppContainerResult := 0, "ptr", ppPointerStart, "ptr", ppPointerFinish, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMarkupContainer(ppContainerResult)
    }

    /**
     * 
     * @param {HGLOBAL} hglobalHTML 
     * @param {Integer} dwFlags 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {IMarkupContainer} 
     */
    ParseGlobal(hglobalHTML, dwFlags, pPointerStart, pPointerFinish) {
        hglobalHTML := hglobalHTML is Win32Handle ? NumGet(hglobalHTML, "ptr") : hglobalHTML

        result := ComCall(14, this, "ptr", hglobalHTML, "uint", dwFlags, "ptr*", &ppContainerResult := 0, "ptr", pPointerStart, "ptr", pPointerFinish, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMarkupContainer(ppContainerResult)
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @returns {BOOL} 
     */
    IsScopedElement(pElement) {
        result := ComCall(15, this, "ptr", pElement, "int*", &pfScoped := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfScoped
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @returns {Integer} 
     */
    GetElementTagId(pElement) {
        result := ComCall(16, this, "ptr", pElement, "int*", &ptagId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ptagId
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {Integer} 
     */
    GetTagIDForName(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(17, this, "ptr", bstrName, "int*", &ptagId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ptagId
    }

    /**
     * 
     * @param {Integer} tagId 
     * @returns {BSTR} 
     */
    GetNameForTagID(tagId) {
        pbstrName := BSTR()
        result := ComCall(18, this, "int", tagId, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * 
     * @param {IHTMLTxtRange} pIRange 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    MovePointersToRange(pIRange, pPointerStart, pPointerFinish) {
        result := ComCall(19, this, "ptr", pIRange, "ptr", pPointerStart, "ptr", pPointerFinish, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(20, this, "ptr", pPointerStart, "ptr", pPointerFinish, "ptr", pIRange, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pchTitle 
     * @returns {HRESULT} 
     */
    BeginUndoUnit(pchTitle) {
        pchTitle := pchTitle is String ? StrPtr(pchTitle) : pchTitle

        result := ComCall(21, this, "ptr", pchTitle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndUndoUnit() {
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
