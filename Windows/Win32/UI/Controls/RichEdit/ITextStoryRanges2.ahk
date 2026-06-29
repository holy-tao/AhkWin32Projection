#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITextStoryRanges.ahk" { ITextStoryRanges }
#Import ".\ITextRange2.ahk" { ITextRange2 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITextStoryRanges2 interface enumerates the stories in an ITextDocument.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextstoryranges2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct ITextStoryRanges2 extends ITextStoryRanges {
    /**
     * The interface identifier for ITextStoryRanges2
     * @type {Guid}
     */
    static IID := Guid("{c241f5e5-7206-11d8-a2c7-00a0d1d6c6b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextStoryRanges2 interfaces
    */
    struct Vtbl extends ITextStoryRanges.Vtbl {
        Item2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextStoryRanges2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an ITextRange2 object for a story, by index, in a stories collection.
     * @remarks
     * The first story has an index of 1, and the last story  has an index equal to the count  retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextstoryranges-getcount">ITextStoryRanges::GetCount</a> method. Negative index values count from the last story to the first; that is, an index of –1 gets the last story in the collection, and an index of –<i>count</i> gets the first story.
     * @param {Integer} Index Type: <b>long</b>
     * 
     * The index of the story range. The default value is 1.
     * @returns {ITextRange2} Type: <b>ITextRange2**</b>
     * 
     * The range.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges2-item2
     */
    Item2(Index) {
        result := ComCall(10, this, "int", Index, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    Query(iid) {
        if (ITextStoryRanges2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Item2 := CallbackCreate(GetMethod(implObj, "Item2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Item2)
    }
}
