#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12GraphicsCommandList5.ahk" { ID3D12GraphicsCommandList5 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12GraphicsCommandList6 extends ID3D12GraphicsCommandList5 {
    /**
     * The interface identifier for ID3D12GraphicsCommandList6
     * @type {Guid}
     */
    static IID := Guid("{c3827890-e548-4cfa-96cf-5689a9370f80}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12GraphicsCommandList6 interfaces
    */
    struct Vtbl extends ID3D12GraphicsCommandList5.Vtbl {
        DispatchMesh : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12GraphicsCommandList6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ThreadGroupCountX 
     * @param {Integer} ThreadGroupCountY 
     * @param {Integer} ThreadGroupCountZ 
     * @returns {String} Nothing - always returns an empty string
     */
    DispatchMesh(ThreadGroupCountX, ThreadGroupCountY, ThreadGroupCountZ) {
        ComCall(79, this, "uint", ThreadGroupCountX, "uint", ThreadGroupCountY, "uint", ThreadGroupCountZ)
    }

    Query(iid) {
        if (ID3D12GraphicsCommandList6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DispatchMesh := CallbackCreate(GetMethod(implObj, "DispatchMesh"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DispatchMesh)
    }
}
