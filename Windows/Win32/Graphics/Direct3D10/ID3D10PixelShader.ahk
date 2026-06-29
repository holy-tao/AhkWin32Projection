#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }

/**
 * A pixel-shader interface manages an executable program (a pixel shader) that controls the pixel-shader stage. (ID3D10PixelShader)
 * @remarks
 * The pixel-shader interface has no methods; use HLSL to implement your shader functionality. All shaders in Direct3D 10 are implemented from a common set of features referred to as the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-common-core">common shader core</a>.
 * 
 * To create a pixel shader interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createpixelshader">ID3D10Device::CreatePixelShader</a>. Before using a pixel shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetshader">ID3D10Device::PSSetShader</a>.
 * 
 * This interface is defined in D3D10.h.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10pixelshader
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10PixelShader extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10PixelShader
     * @type {Guid}
     */
    static IID := Guid("{4968b601-9d00-4cde-8346-8e7f675819b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10PixelShader interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10PixelShader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D10PixelShader.IID.Equals(iid)) {
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
