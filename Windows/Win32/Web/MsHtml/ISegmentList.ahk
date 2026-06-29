#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SELECTION_TYPE.ahk" { SELECTION_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ISegmentListIterator.ahk" { ISegmentListIterator }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISegmentList extends IUnknown {
    /**
     * The interface identifier for ISegmentList
     * @type {Guid}
     */
    static IID := Guid("{3050f605-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISegmentList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateIterator : IntPtr
        GetType        : IntPtr
        IsEmpty        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISegmentList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ISegmentListIterator} 
     */
    CreateIterator() {
        result := ComCall(3, this, "ptr*", &ppIIter := 0, "HRESULT")
        return ISegmentListIterator(ppIIter)
    }

    /**
     * 
     * @returns {SELECTION_TYPE} 
     */
    GetType() {
        result := ComCall(4, this, "int*", &peType := 0, "HRESULT")
        return peType
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsEmpty() {
        result := ComCall(5, this, BOOL.Ptr, &pfEmpty := 0, "HRESULT")
        return pfEmpty
    }

    Query(iid) {
        if (ISegmentList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateIterator := CallbackCreate(GetMethod(implObj, "CreateIterator"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.IsEmpty := CallbackCreate(GetMethod(implObj, "IsEmpty"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateIterator)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.IsEmpty)
    }
}
