#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITextRange.ahk" { ITextRange }

/**
 * The purpose of the ITextStoryRanges interface is to enumerate the stories in an ITextDocument.
 * @remarks
 * You get a pointer to an <b>ITextStoryRanges</b> collection by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-getstoryranges">GetStoryRanges</a> method. Each story obtained from this collection is represented by an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object that covers the whole story. Text Object Model (TOM) engines that only have a single story do not need to implement an <b>ITextStoryRanges</b> interface. Your code should only get a stories collection if <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-getstorycount">GetStoryCount</a> returns a story count greater than one.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextstoryranges
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct ITextStoryRanges extends IDispatch {
    /**
     * The interface identifier for ITextStoryRanges
     * @type {Guid}
     */
    static IID := Guid("{8cc497c5-a1df-11ce-8098-00aa0047be5d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextStoryRanges interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        _NewEnum : IntPtr
        Item     : IntPtr
        GetCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextStoryRanges.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an IEnumVARIANT enumerator interface for this collection of stories.
     * @remarks
     * This definition together with the implementation of 
     * 				<b>IEnumVARIANT</b>, enables one to support the following Microsoft Visual Basic for Applications (VBA) code.
     * 
     * 
     * ```
     *     Dim t As ITextDocument
     *     Dim c As ITextStoryRanges
     *     Dim r As ITextRange
     * 
     *     Set t = gObj
     *     Set c = t.StoryRanges
     * 
     *     For Each r In c
     *         Debug.Print r.Text
     *     Next
     * ```
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * The pointer to the enumerator interface.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges-_newenum
     */
    _NewEnum() {
        result := ComCall(7, this, "ptr*", &ppunkEnum := 0, "HRESULT")
        return IUnknown(ppunkEnum)
    }

    /**
     * Retrieves an ITextRange object for the Indexth story in this story collection.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Index of story range that is retrieved. The default value is 1, which indicates the first story in the collection. <i>Count</i>, given by <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextstoryranges-getcount">ITextStoryRanges::GetCount</a>, indicates the last story in the collection. If <i>Index</i> is less than zero, the stories are counted from last to first, with -1 being the index of the last story in the collection, and 
     * 					<i>Index</i> = - <i>Count</i> indicating the first story in the collection.
     * @returns {ITextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges-item
     */
    Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }

    /**
     * Retrieves the number of stories in the specified stories collection.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of stories.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges-getcount
     */
    GetCount() {
        result := ComCall(9, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    Query(iid) {
        if (ITextStoryRanges.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl._NewEnum := CallbackCreate(GetMethod(implObj, "_NewEnum"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl._NewEnum)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.GetCount)
    }
}
