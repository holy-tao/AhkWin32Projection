#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsObject extends IUnknown {
    /**
     * The interface identifier for IKsObject
     * @type {Guid}
     */
    static IID := Guid("{423c13a2-2070-11d0-9ef7-00aa00a216a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsGetObjectHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    KsGetObjectHandle() {
        result := ComCall(3, this, HANDLE.Owned)
        return result
    }

    Query(iid) {
        if (IKsObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsGetObjectHandle := CallbackCreate(GetMethod(implObj, "KsGetObjectHandle"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsGetObjectHandle)
    }
}
