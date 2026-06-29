#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import ".\IHTMLTxtRange.ahk" { IHTMLTxtRange }
#Import ".\ELEMENT_TAG_ID.ahk" { ELEMENT_TAG_ID }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import ".\IMarkupContainer.ahk" { IMarkupContainer }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IMarkupServices extends IUnknown {
    /**
     * The interface identifier for IMarkupServices
     * @type {Guid}
     */
    static IID := Guid("{3050f4a0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMarkupServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateMarkupPointer   : IntPtr
        CreateMarkupContainer : IntPtr
        CreateElement         : IntPtr
        CloneElement          : IntPtr
        InsertElement         : IntPtr
        RemoveElement         : IntPtr
        Remove                : IntPtr
        Copy                  : IntPtr
        Move                  : IntPtr
        InsertText            : IntPtr
        ParseString           : IntPtr
        ParseGlobal           : IntPtr
        IsScopedElement       : IntPtr
        GetElementTagId       : IntPtr
        GetTagIDForName       : IntPtr
        GetNameForTagID       : IntPtr
        MovePointersToRange   : IntPtr
        MoveRangeToPointers   : IntPtr
        BeginUndoUnit         : IntPtr
        EndUndoUnit           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMarkupServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IMarkupPointer} 
     */
    CreateMarkupPointer() {
        result := ComCall(3, this, "ptr*", &ppPointer := 0, "HRESULT")
        return IMarkupPointer(ppPointer)
    }

    /**
     * 
     * @returns {IMarkupContainer} 
     */
    CreateMarkupContainer() {
        result := ComCall(4, this, "ptr*", &ppMarkupContainer := 0, "HRESULT")
        return IMarkupContainer(ppMarkupContainer)
    }

    /**
     * 
     * @param {ELEMENT_TAG_ID} tagID 
     * @param {PWSTR} pchAttributes 
     * @returns {IHTMLElement} 
     */
    CreateElement(tagID, pchAttributes) {
        pchAttributes := pchAttributes is String ? StrPtr(pchAttributes) : pchAttributes

        result := ComCall(5, this, ELEMENT_TAG_ID, tagID, "ptr", pchAttributes, "ptr*", &ppElement := 0, "HRESULT")
        return IHTMLElement(ppElement)
    }

    /**
     * 
     * @param {IHTMLElement} pElemCloneThis 
     * @returns {IHTMLElement} 
     */
    CloneElement(pElemCloneThis) {
        result := ComCall(6, this, "ptr", pElemCloneThis, "ptr*", &ppElementTheClone := 0, "HRESULT")
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
     * @param {IMarkupPointer} ppPointerStart 
     * @param {IMarkupPointer} ppPointerFinish 
     * @returns {IMarkupContainer} 
     */
    ParseString(pchHTML, dwFlags, ppPointerStart, ppPointerFinish) {
        pchHTML := pchHTML is String ? StrPtr(pchHTML) : pchHTML

        result := ComCall(13, this, "ptr", pchHTML, "uint", dwFlags, "ptr*", &ppContainerResult := 0, "ptr", ppPointerStart, "ptr", ppPointerFinish, "HRESULT")
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
        result := ComCall(14, this, HGLOBAL, hglobalHTML, "uint", dwFlags, "ptr*", &ppContainerResult := 0, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return IMarkupContainer(ppContainerResult)
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @returns {BOOL} 
     */
    IsScopedElement(pElement) {
        result := ComCall(15, this, "ptr", pElement, BOOL.Ptr, &pfScoped := 0, "HRESULT")
        return pfScoped
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @returns {ELEMENT_TAG_ID} 
     */
    GetElementTagId(pElement) {
        result := ComCall(16, this, "ptr", pElement, "int*", &ptagId := 0, "HRESULT")
        return ptagId
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {ELEMENT_TAG_ID} 
     */
    GetTagIDForName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(17, this, BSTR, bstrName, "int*", &ptagId := 0, "HRESULT")
        return ptagId
    }

    /**
     * 
     * @param {ELEMENT_TAG_ID} tagId 
     * @returns {BSTR} 
     */
    GetNameForTagID(tagId) {
        pbstrName := BSTR.Owned()
        result := ComCall(18, this, ELEMENT_TAG_ID, tagId, BSTR.Ptr, pbstrName, "HRESULT")
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

    Query(iid) {
        if (IMarkupServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateMarkupPointer := CallbackCreate(GetMethod(implObj, "CreateMarkupPointer"), flags, 2)
        this.vtbl.CreateMarkupContainer := CallbackCreate(GetMethod(implObj, "CreateMarkupContainer"), flags, 2)
        this.vtbl.CreateElement := CallbackCreate(GetMethod(implObj, "CreateElement"), flags, 4)
        this.vtbl.CloneElement := CallbackCreate(GetMethod(implObj, "CloneElement"), flags, 3)
        this.vtbl.InsertElement := CallbackCreate(GetMethod(implObj, "InsertElement"), flags, 4)
        this.vtbl.RemoveElement := CallbackCreate(GetMethod(implObj, "RemoveElement"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
        this.vtbl.Copy := CallbackCreate(GetMethod(implObj, "Copy"), flags, 4)
        this.vtbl.Move := CallbackCreate(GetMethod(implObj, "Move"), flags, 4)
        this.vtbl.InsertText := CallbackCreate(GetMethod(implObj, "InsertText"), flags, 4)
        this.vtbl.ParseString := CallbackCreate(GetMethod(implObj, "ParseString"), flags, 6)
        this.vtbl.ParseGlobal := CallbackCreate(GetMethod(implObj, "ParseGlobal"), flags, 6)
        this.vtbl.IsScopedElement := CallbackCreate(GetMethod(implObj, "IsScopedElement"), flags, 3)
        this.vtbl.GetElementTagId := CallbackCreate(GetMethod(implObj, "GetElementTagId"), flags, 3)
        this.vtbl.GetTagIDForName := CallbackCreate(GetMethod(implObj, "GetTagIDForName"), flags, 3)
        this.vtbl.GetNameForTagID := CallbackCreate(GetMethod(implObj, "GetNameForTagID"), flags, 3)
        this.vtbl.MovePointersToRange := CallbackCreate(GetMethod(implObj, "MovePointersToRange"), flags, 4)
        this.vtbl.MoveRangeToPointers := CallbackCreate(GetMethod(implObj, "MoveRangeToPointers"), flags, 4)
        this.vtbl.BeginUndoUnit := CallbackCreate(GetMethod(implObj, "BeginUndoUnit"), flags, 2)
        this.vtbl.EndUndoUnit := CallbackCreate(GetMethod(implObj, "EndUndoUnit"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateMarkupPointer)
        CallbackFree(this.vtbl.CreateMarkupContainer)
        CallbackFree(this.vtbl.CreateElement)
        CallbackFree(this.vtbl.CloneElement)
        CallbackFree(this.vtbl.InsertElement)
        CallbackFree(this.vtbl.RemoveElement)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Copy)
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.InsertText)
        CallbackFree(this.vtbl.ParseString)
        CallbackFree(this.vtbl.ParseGlobal)
        CallbackFree(this.vtbl.IsScopedElement)
        CallbackFree(this.vtbl.GetElementTagId)
        CallbackFree(this.vtbl.GetTagIDForName)
        CallbackFree(this.vtbl.GetNameForTagID)
        CallbackFree(this.vtbl.MovePointersToRange)
        CallbackFree(this.vtbl.MoveRangeToPointers)
        CallbackFree(this.vtbl.BeginUndoUnit)
        CallbackFree(this.vtbl.EndUndoUnit)
    }
}
