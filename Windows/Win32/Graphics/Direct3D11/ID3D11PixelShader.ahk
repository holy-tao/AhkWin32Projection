#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }

/**
 * A pixel-shader interface manages an executable program (a pixel shader) that controls the pixel-shader stage. (ID3D11PixelShader)
 * @remarks
 * The pixel-shader interface has no methods; use HLSL to implement your shader functionality. All shaders in are implemented from a common set of features referred to as the common-shader core..
 * 
 * To create a pixel shader interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createpixelshader">ID3D11Device::CreatePixelShader</a>. Before using a pixel shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshader">ID3D11DeviceContext::PSSetShader</a>.
 * 
 * This interface is defined in D3D11.h.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11pixelshader
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11PixelShader extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11PixelShader
     * @type {Guid}
     */
    static IID := Guid("{ea82e40d-51dc-4f33-93d4-db7c9125ae8c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11PixelShader interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11PixelShader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D11PixelShader.IID.Equals(iid)) {
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
