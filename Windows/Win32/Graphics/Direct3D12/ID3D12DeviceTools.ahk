#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceTools extends IUnknown {
    /**
     * The interface identifier for ID3D12DeviceTools
     * @type {Guid}
     */
    static IID := Guid("{2ea68e9c-19c3-4e47-a109-6cdadff0aca9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceTools interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetNextAllocationAddress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceTools.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} nextAllocationVirtualAddress 
     * @returns {String} Nothing - always returns an empty string
     */
    SetNextAllocationAddress(nextAllocationVirtualAddress) {
        ComCall(3, this, "uint", nextAllocationVirtualAddress)
    }

    Query(iid) {
        if (ID3D12DeviceTools.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetNextAllocationAddress := CallbackCreate(GetMethod(implObj, "SetNextAllocationAddress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetNextAllocationAddress)
    }
}
