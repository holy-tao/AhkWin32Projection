#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Resource.ahk

/**
 * A buffer interface accesses a buffer resource, which is unstructured memory. Buffers typically store vertex or index data. (ID3D10Buffer)
 * @remarks
 * Three types of buffers can be created; <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">vertex</a>, index, and shader-constant buffers. To create a buffer resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createbuffer">ID3D10Device::CreateBuffer</a>.
 * 
 * A buffer must be bound to the pipeline before it can be accessed. Buffers can be bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage">input-assembler</a> stage by calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetvertexbuffers">ID3D10Device::IASetVertexBuffers</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetindexbuffer">ID3D10Device::IASetIndexBuffer</a>, and to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage">stream-output</a> stage by a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-sosettargets">ID3D10Device::SOSetTargets</a>.
 * 
 * Buffers can be bound to multiple pipeline stages simultaneously for reading. A buffer can also be bound to a single pipeline stage for writing; however, the same buffer cannot be bound for reading and writing simultaneously. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">binding resources</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d10/nn-d3d10-id3d10buffer
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
     * Get a pointer to the data contained in the resource and deny GPU access to the resource.
     * @remarks
     * For the CPU to write the contents of a resource, the resource must be created with the dynamic usage flag, D3D10_USAGE_DYNAMIC. 
     *       To both read and write those contents, the resource must be created with the staging usage flag, D3D10_USAGE_STAGING. (For more information about 
     *       these flags, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a>.) <b>ID3D10Buffer::Map</b> will retrieve a pointer to the resource data. 
     *       For a discussion on how to access resources efficiently, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">Copying and Accessing Resource Data (Direct3D 10)</a>.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10buffer-unmap">ID3D10Buffer::Unmap</a> to signify that the application has finished accessing the resource.
     * 
     * <b>ID3D10Buffer::Map</b> has a few other restrictions. For example:
     * 
     * <ul>
     * <li>The same buffer cannot be mapped multiple times; in other words, do not call <b>ID3D10Buffer::Map</b> on a buffer that is already mapped.</li>
     * <li>Any buffer that is bound to the pipeline must be unmapped before any rendering operation (that is, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-draw">ID3D10Device::Draw</a>) 
     *         can be executed.</li>
     * </ul>
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 10:
     * 
     * <b>ID3D10Buffer::Map</b> in Direct3D 10 is analogous to resource <a href="https://docs.microsoft.com/windows/desktop/direct3d9/locking-resources">Lock</a> in Direct3D 9.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} MapType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a></b>
     * 
     * Flag that specifies the CPU's permissions for the reading and writing of a resource. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a>.
     * @param {Integer} MapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flag that specifies what the CPU should do when the GPU is busy (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map_flag">D3D10_MAP_FLAG</a>). This flag is optional.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Pointer to the buffer resource data.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10/nf-d3d10-id3d10buffer-map
     */
    Map(MapType, MapFlags) {
        result := ComCall(10, this, "int", MapType, "uint", MapFlags, "ptr*", &ppData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppData
    }

    /**
     * Invalidate the pointer to the resource retrieved by ID3D10Buffer::Map and reenable GPU access to the resource.
     * @remarks
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 10:
     * 
     * Unmap() in Direct3D 10 is analogous to resource Unlock() in Direct3D 9.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10/nf-d3d10-id3d10buffer-unmap
     */
    Unmap() {
        ComCall(11, this)
    }

    /**
     * Get the properties of a buffer resource. (ID3D10Buffer.GetDesc)
     * @param {Pointer<D3D10_BUFFER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_buffer_desc">D3D10_BUFFER_DESC</a>*</b>
     * 
     * Pointer to a resource description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_buffer_desc">D3D10_BUFFER_DESC</a>) filled in by the method. This pointer cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10/nf-d3d10-id3d10buffer-getdesc
     */
    GetDesc(pDesc) {
        ComCall(12, this, "ptr", pDesc)
    }
}
