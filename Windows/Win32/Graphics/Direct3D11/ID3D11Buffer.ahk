#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11Resource.ahk" { ID3D11Resource }
#Import ".\D3D11_BUFFER_DESC.ahk" { D3D11_BUFFER_DESC }

/**
 * A buffer interface accesses a buffer resource, which is unstructured memory. Buffers typically store vertex or index data. (ID3D11Buffer)
 * @remarks
 * There are three types of buffers: vertex, index, or a shader-constant buffer. Create a buffer resource by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createbuffer">ID3D11Device::CreateBuffer</a>.
 * 
 * A buffer must be bound to the pipeline before it can be accessed. Buffers can be bound to the input-assembler stage by calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetvertexbuffers">ID3D11DeviceContext::IASetVertexBuffers</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetindexbuffer">ID3D11DeviceContext::IASetIndexBuffer</a>, to the stream-output stage by a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-sosettargets">ID3D11DeviceContext::SOSetTargets</a>, and to a shader stage by calling the appropriate shader method (such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetconstantbuffers">ID3D11DeviceContext::VSSetConstantBuffers</a> for example).
 * 
 * Buffers can be bound to multiple pipeline stages simultaneously for reading. A buffer can also be bound to a single pipeline stage for writing; however, the same buffer cannot be bound for reading and writing simultaneously.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11buffer
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Buffer extends ID3D11Resource {
    /**
     * The interface identifier for ID3D11Buffer
     * @type {Guid}
     */
    static IID := Guid("{48570b85-d1ee-4fcd-a250-eb350722b037}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Buffer interfaces
    */
    struct Vtbl extends ID3D11Resource.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Buffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the properties of a buffer resource. (ID3D11Buffer.GetDesc)
     * @param {Pointer<D3D11_BUFFER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a>*</b>
     * 
     * Pointer to a resource description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a>) filled in by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11buffer-getdesc
     */
    GetDesc(pDesc) {
        ComCall(10, this, D3D11_BUFFER_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11Buffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
    }
}
