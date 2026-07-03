#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The ISynchronizeHandle (objidlbase.h) interface retrieves a handle associated with a synchronization object.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-isynchronizehandle
 * @namespace Windows.Win32.System.Com
 */
export default struct ISynchronizeHandle extends IUnknown {
    /**
     * The interface identifier for ISynchronizeHandle
     * @type {Guid}
     */
    static IID := Guid("{00000031-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISynchronizeHandle interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISynchronizeHandle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ISynchronizeHandle::GetHandle (objidlbase.h) method retrieves a handle to the synchronization object.
     * @returns {HANDLE} A pointer to the variable that receives a handle to the synchronization object.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronizehandle-gethandle
     */
    GetHandle() {
        ph := HANDLE.Owned()
        result := ComCall(3, this, HANDLE.Ptr, ph, "HRESULT")
        return ph
    }

    Query(iid) {
        if (ISynchronizeHandle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHandle := CallbackCreate(GetMethod(implObj, "GetHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHandle)
    }
}
