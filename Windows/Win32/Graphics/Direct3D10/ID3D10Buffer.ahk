#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Resource.ahk

/**
 * A buffer interface accesses a buffer resource, which is unstructured memory. Buffers typically store vertex or index data.
 * @remarks
 * 
  * Three types of buffers can be created; <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">vertex</a>, index, and shader-constant buffers. To create a buffer resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createbuffer">ID3D10Device::CreateBuffer</a>.
  * 
  * A buffer must be bound to the pipeline before it can be accessed. Buffers can be bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage">input-assembler</a> stage by calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetvertexbuffers">ID3D10Device::IASetVertexBuffers</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetindexbuffer">ID3D10Device::IASetIndexBuffer</a>, and to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage">stream-output</a> stage by a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-sosettargets">ID3D10Device::SOSetTargets</a>.
  * 
  * Buffers can be bound to multiple pipeline stages simultaneously for reading. A buffer can also be bound to a single pipeline stage for writing; however, the same buffer cannot be bound for reading and writing simultaneously. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">binding resources</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10buffer
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Buffer extends ID3D10Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Buffer
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c02-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Map", "Unmap", "GetDesc"]

    /**
     * 
     * @param {Integer} MapType 
     * @param {Integer} MapFlags 
     * @param {Pointer<Pointer<Void>>} ppData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10buffer-map
     */
    Map(MapType, MapFlags, ppData) {
        result := ComCall(10, this, "int", MapType, "uint", MapFlags, "ptr*", ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10buffer-unmap
     */
    Unmap() {
        ComCall(11, this)
    }

    /**
     * 
     * @param {Pointer<D3D10_BUFFER_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10buffer-getdesc
     */
    GetDesc(pDesc) {
        ComCall(12, this, "ptr", pDesc)
    }
}
