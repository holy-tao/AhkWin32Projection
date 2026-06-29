#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IGCHostControl extends IUnknown {
    /**
     * The interface identifier for IGCHostControl
     * @type {Guid}
     */
    static IID := Guid("{5513d564-8374-4cb9-aed9-0083f4160a1d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGCHostControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestVirtualMemLimit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGCHostControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} sztMaxVirtualMemMB 
     * @param {Pointer<Pointer>} psztNewMaxVirtualMemMB 
     * @returns {HRESULT} 
     */
    RequestVirtualMemLimit(sztMaxVirtualMemMB, psztNewMaxVirtualMemMB) {
        psztNewMaxVirtualMemMBMarshal := psztNewMaxVirtualMemMB is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", sztMaxVirtualMemMB, psztNewMaxVirtualMemMBMarshal, psztNewMaxVirtualMemMB, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGCHostControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestVirtualMemLimit := CallbackCreate(GetMethod(implObj, "RequestVirtualMemLimit"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestVirtualMemLimit)
    }
}
