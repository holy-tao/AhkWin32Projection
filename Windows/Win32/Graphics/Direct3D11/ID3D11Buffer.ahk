#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Resource.ahk

/**
 * A buffer interface accesses a buffer resource, which is unstructured memory. Buffers typically store vertex or index data.
 * @remarks
 * 
 * There are three types of buffers: vertex, index, or a shader-constant buffer. Create a buffer resource by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createbuffer">ID3D11Device::CreateBuffer</a>.
 * 
 * A buffer must be bound to the pipeline before it can be accessed. Buffers can be bound to the input-assembler stage by calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetvertexbuffers">ID3D11DeviceContext::IASetVertexBuffers</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetindexbuffer">ID3D11DeviceContext::IASetIndexBuffer</a>, to the stream-output stage by a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-sosettargets">ID3D11DeviceContext::SOSetTargets</a>, and to a shader stage by calling the appropriate shader method (such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetconstantbuffers">ID3D11DeviceContext::VSSetConstantBuffers</a> for example).
 * 
 * Buffers can be bound to multiple pipeline stages simultaneously for reading. A buffer can also be bound to a single pipeline stage for writing; however, the same buffer cannot be bound for reading and writing simultaneously.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11buffer
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Buffer extends ID3D11Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Buffer
     * @type {Guid}
     */
    static IID => Guid("{48570b85-d1ee-4fcd-a250-eb350722b037}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @param {Pointer<D3D11_BUFFER_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11buffer-getdesc
     */
    GetDesc(pDesc) {
        ComCall(10, this, "ptr", pDesc)
    }
}
