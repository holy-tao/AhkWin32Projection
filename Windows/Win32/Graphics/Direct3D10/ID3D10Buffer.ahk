#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10Resource.ahk" { ID3D10Resource }
#Import ".\D3D10_BUFFER_DESC.ahk" { D3D10_BUFFER_DESC }
#Import ".\D3D10_MAP.ahk" { D3D10_MAP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * A buffer interface accesses a buffer resource, which is unstructured memory. Buffers typically store vertex or index data. (ID3D10Buffer)
 * @remarks
 * Three types of buffers can be created; <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">vertex</a>, index, and shader-constant buffers. To create a buffer resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createbuffer">ID3D10Device::CreateBuffer</a>.
 * 
 * A buffer must be bound to the pipeline before it can be accessed. Buffers can be bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage">input-assembler</a> stage by calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetvertexbuffers">ID3D10Device::IASetVertexBuffers</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetindexbuffer">ID3D10Device::IASetIndexBuffer</a>, and to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage">stream-output</a> stage by a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-sosettargets">ID3D10Device::SOSetTargets</a>.
 * 
 * Buffers can be bound to multiple pipeline stages simultaneously for reading. A buffer can also be bound to a single pipeline stage for writing; however, the same buffer cannot be bound for reading and writing simultaneously. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">binding resources</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10buffer
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10Buffer extends ID3D10Resource {
    /**
     * The interface identifier for ID3D10Buffer
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c02-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10Buffer interfaces
    */
    struct Vtbl extends ID3D10Resource.Vtbl {
        Map     : IntPtr
        Unmap   : IntPtr
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10Buffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {D3D10_MAP} MapType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a></b>
     * 
     * Flag that specifies the CPU's permissions for the reading and writing of a resource. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a>.
     * @param {Integer} MapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flag that specifies what the CPU should do when the GPU is busy (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map_flag">D3D10_MAP_FLAG</a>). This flag is optional.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Pointer to the buffer resource data.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10buffer-map
     */
    Map(MapType, MapFlags) {
        result := ComCall(10, this, D3D10_MAP, MapType, "uint", MapFlags, "ptr*", &ppData := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10buffer-unmap
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10buffer-getdesc
     */
    GetDesc(pDesc) {
        ComCall(12, this, D3D10_BUFFER_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10Buffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Map := CallbackCreate(GetMethod(implObj, "Map"), flags, 4)
        this.vtbl.Unmap := CallbackCreate(GetMethod(implObj, "Unmap"), flags, 1)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Map)
        CallbackFree(this.vtbl.Unmap)
        CallbackFree(this.vtbl.GetDesc)
    }
}
