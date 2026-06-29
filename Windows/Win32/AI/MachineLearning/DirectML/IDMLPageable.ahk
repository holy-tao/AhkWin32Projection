#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDMLDeviceChild.ahk" { IDMLDeviceChild }

/**
 * Implemented by objects that can be evicted from GPU memory, and hence that can be supplied to IDMLDevice::Evict and IDMLDevice::MakeResident.
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmlpageable
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLPageable extends IDMLDeviceChild {
    /**
     * The interface identifier for IDMLPageable
     * @type {Guid}
     */
    static IID := Guid("{b1ab0825-4542-4a4b-8617-6dde6e8f6201}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLPageable interfaces
    */
    struct Vtbl extends IDMLDeviceChild.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLPageable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDMLPageable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
