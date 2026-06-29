#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ISynchronizeHandle.ahk" { ISynchronizeHandle }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ISynchronizeEvent (objidlbase.h) interface assigns an event handle to a synchronization object.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-isynchronizeevent
 * @namespace Windows.Win32.System.Com
 */
export default struct ISynchronizeEvent extends ISynchronizeHandle {
    /**
     * The interface identifier for ISynchronizeEvent
     * @type {Guid}
     */
    static IID := Guid("{00000032-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISynchronizeEvent interfaces
    */
    struct Vtbl extends ISynchronizeHandle.Vtbl {
        SetEventHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISynchronizeEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ISynchronizeEvent::SetEventHandle (objidlbase.h) method assigns an event handle to a synchronization object.
     * @param {Pointer<HANDLE>} ph A pointer to the event handle.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronizeevent-seteventhandle
     */
    SetEventHandle(ph) {
        result := ComCall(4, this, HANDLE.Ptr, ph, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISynchronizeEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetEventHandle := CallbackCreate(GetMethod(implObj, "SetEventHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetEventHandle)
    }
}
