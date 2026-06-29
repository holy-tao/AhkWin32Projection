#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }

/**
 * An input-layout interface accesses the input data for the input-assembler stage.
 * @remarks
 * This interface is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createinputlayout">ID3D10Device::CreateInputLayout</a>; use <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetinputlayout">ID3D10Device::IASetInputLayout</a> to bind it to the graphics pipeline.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10inputlayout
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10InputLayout extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10InputLayout
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c0b-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10InputLayout interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10InputLayout.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D10InputLayout.IID.Equals(iid)) {
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
