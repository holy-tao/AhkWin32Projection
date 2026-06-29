#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISegment.ahk" { ISegment }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISegmentListIterator extends IUnknown {
    /**
     * The interface identifier for ISegmentListIterator
     * @type {Guid}
     */
    static IID := Guid("{3050f692-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISegmentListIterator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Current : IntPtr
        First   : IntPtr
        IsDone  : IntPtr
        Advance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISegmentListIterator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ISegment} 
     */
    Current() {
        result := ComCall(3, this, "ptr*", &ppISegment := 0, "HRESULT")
        return ISegment(ppISegment)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    First() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDone() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Advance() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISegmentListIterator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Current := CallbackCreate(GetMethod(implObj, "Current"), flags, 2)
        this.vtbl.First := CallbackCreate(GetMethod(implObj, "First"), flags, 1)
        this.vtbl.IsDone := CallbackCreate(GetMethod(implObj, "IsDone"), flags, 1)
        this.vtbl.Advance := CallbackCreate(GetMethod(implObj, "Advance"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Current)
        CallbackFree(this.vtbl.First)
        CallbackFree(this.vtbl.IsDone)
        CallbackFree(this.vtbl.Advance)
    }
}
