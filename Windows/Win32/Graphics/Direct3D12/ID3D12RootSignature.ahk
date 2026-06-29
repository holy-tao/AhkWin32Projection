#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12DeviceChild.ahk" { ID3D12DeviceChild }

/**
 * The root signature defines what resources are bound to the graphics pipeline. A root signature is configured by the app and links command lists to the resources the shaders require. Currently, there is one graphics and one compute root signature per app.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignature
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12RootSignature extends ID3D12DeviceChild {
    /**
     * The interface identifier for ID3D12RootSignature
     * @type {Guid}
     */
    static IID := Guid("{c54a6b66-72df-4ee8-8be5-a946a1429214}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12RootSignature interfaces
    */
    struct Vtbl extends ID3D12DeviceChild.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12RootSignature.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D12RootSignature.IID.Equals(iid)) {
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
