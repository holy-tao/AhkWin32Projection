#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }

/**
 * A vertex-shader interface manages an executable program (a vertex shader) that controls the vertex-shader stage. (ID3D10VertexShader)
 * @remarks
 * The vertex-shader interface has no methods; use HLSL to implement your shader functionality. All shaders in Direct3D 10 are implemented from a common set of features referred to as the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-common-core">common shader core</a>.
 * 
 * To create a vertex shader interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createvertexshader">ID3D10Device::CreateVertexShader</a>. Before using a vertex shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetshader">ID3D10Device::VSSetShader</a>.
 * 
 * This interface is defined in D3D10.h.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10vertexshader
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10VertexShader extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10VertexShader
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c0a-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10VertexShader interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10VertexShader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D10VertexShader.IID.Equals(iid)) {
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
