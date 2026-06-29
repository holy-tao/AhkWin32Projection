#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12DeviceChild.ahk" { ID3D12DeviceChild }

/**
 * An interface from which many other core interfaces inherit from. It indicates that the object type encapsulates some amount of GPU-accessible memory; but does not strongly indicate whether the application can manipulate the object's residency.
 * @remarks
 * For more details, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/memory-management">Memory Management in Direct3D 12</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-makeresident">MakeResident</a> method reference.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12pageable
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Pageable extends ID3D12DeviceChild {
    /**
     * The interface identifier for ID3D12Pageable
     * @type {Guid}
     */
    static IID := Guid("{63ee58fb-1268-4835-86da-f008ce62f0d6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Pageable interfaces
    */
    struct Vtbl extends ID3D12DeviceChild.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Pageable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D12Pageable.IID.Equals(iid)) {
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
