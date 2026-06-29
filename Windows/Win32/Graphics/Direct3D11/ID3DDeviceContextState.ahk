#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }

/**
 * The ID3DDeviceContextState interface represents a context state object, which holds state and behavior information about a Microsoft Direct3D device.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3ddevicecontextstate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3DDeviceContextState extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3DDeviceContextState
     * @type {Guid}
     */
    static IID := Guid("{5c1e0d8a-7c23-48f9-8c59-a92958ceff11}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DDeviceContextState interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DDeviceContextState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3DDeviceContextState.IID.Equals(iid)) {
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
