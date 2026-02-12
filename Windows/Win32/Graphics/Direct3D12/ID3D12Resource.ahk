#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_RESOURCE_DESC.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Encapsulates a generalized ability of the CPU and GPU to read and write to physical memory, or heaps. It contains abstractions for organizing and manipulating simple arrays of data as well as multidimensional data optimized for shader sampling.
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nn-d3d12-id3d12resource
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Resource extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Resource
     * @type {Guid}
     */
    static IID => Guid("{696442be-a72e-4059-bc79-5b5c98040fad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Map", "Unmap", "GetDesc", "GetGPUVirtualAddress", "WriteToSubresource", "ReadFromSubresource", "GetHeapProperties"]

    /**
     * Gets a CPU pointer to the specified subresource in the resource, but may not disclose the pointer value to applications. Map also invalidates the CPU cache, when necessary, so that CPU reads to this address reflect any modifications made by the GPU.
     * @remarks
     * <b>Map</b> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-unmap">Unmap</a> can be called by multiple threads safely. Nested <b>Map</b> calls are supported and are ref-counted. The first call to <b>Map</b> allocates a CPU virtual address range for the resource. The last call to <b>Unmap</b> deallocates the CPU virtual address range. The CPU virtual address is commonly returned to the application; but manipulating the contents of textures with unknown layouts precludes disclosing the CPU virtual address. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-writetosubresource">WriteToSubresource</a> for more details. Applications cannot rely on the address being consistent, unless <b>Map</b> is persistently nested.
     * 
     * 
     * Pointers returned by <b>Map</b> are not guaranteed to have all the capabilities of normal pointers, but most applications won't notice a difference in normal usage. For example, pointers with WRITE_COMBINE behavior have weaker CPU memory ordering guarantees than WRITE_BACK behavior. Memory accessible by both CPU and GPU are not guaranteed to share the same atomic memory guarantees that the CPU has, due to PCIe limitations. Use fences for synchronization.
     * 
     * 
     * There are two usage model categories for <b>Map</b>, simple and advanced. The simple usage models maximize tool performance, so applications are recommended to stick with the simple models until the advanced models are proven to be required by the app.
     * 
     * 
     * <h3><a id="Simple_Usage_Models"></a><a id="simple_usage_models"></a><a id="SIMPLE_USAGE_MODELS"></a>Simple Usage Models</h3>
     * Applications should stick to the heap type abstractions of UPLOAD, DEFAULT, and READBACK, in order to support all adapter architectures reasonably well.
     * 
     * Applications should avoid CPU reads from pointers to resources on UPLOAD heaps, even accidently. CPU reads will work, but are prohibitively slow on many common GPU architectures, so consider the following:
     * 
     * <ul>
     * <li>
     * Don't make the CPU read from resources associated with heaps that are D3D12_HEAP_TYPE_UPLOAD or have D3D12_CPU_PAGE_PROPERTY_WRITE_COMBINE.
     * 
     * </li>
     * <li>
     * The memory region to which <b>pData</b> points can be allocated with <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">PAGE_WRITECOMBINE</a>, and your app must honor all restrictions that are associated with such memory.
     * 
     * </li>
     * <li>
     * Even the following C++ code can read from memory and trigger the performance penalty because the code can expand to the following x86 assembly code.
     *               
     * 
     * C++ code:
     *               
     * 
     * 
     * ```
     * *((int*)MappedResource.pData) = 0;
     * ```
     * 
     * 
     * x86 assembly code:
     *               
     * 
     * 
     * ```
     * AND DWORD PTR [EAX],0
     * ```
     * 
     * 
     * </li>
     * <li>
     * Use the appropriate optimization settings and language constructs to help avoid this performance penalty. For example, you can avoid the xor optimization by using a <b>volatile</b> pointer or by optimizing for code speed instead of code size.
     * 
     * </li>
     * </ul>
     * Applications are encouraged to leave resources unmapped while the CPU will not modify them, and use tight, accurate ranges at all times. This enables the fastest modes for tools, like <a href="https://docs.microsoft.com/visualstudio/debugger/visual-studio-graphics-diagnostics">Graphics Debugging</a> and the debug layer. Such tools need to track all CPU modifications to memory that the GPU could read.
     * 
     * 
     * <h3><a id="Advanced_Usage_Models"></a><a id="advanced_usage_models"></a><a id="ADVANCED_USAGE_MODELS"></a>Advanced Usage Models</h3>
     * Resources on CPU-accessible heaps can be persistently mapped, meaning <b>Map</b> can be called once, immediately after resource creation. <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-unmap">Unmap</a> never needs to be called, but the address returned from <b>Map</b> must no longer be used after the last reference to the resource is released. When using persistent map, the application must ensure the CPU finishes writing data into memory before the GPU executes a command list that reads or writes the memory. In common scenarios, the application merely must write to memory before calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-executecommandlists">ExecuteCommandLists</a>; but using a fence to delay command list execution works as well.
     * 
     * 
     * All CPU-accessible memory types support persistent mapping usage, where the resource is mapped but then never unmapped, provided the application does not access the pointer after the resource has been disposed.
     * @param {Integer} Subresource Type: <b>UINT</b>
     * 
     * Specifies the index number of the subresource.
     * @param {Pointer<D3D12_RANGE>} pReadRange Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_range">D3D12_RANGE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_range">D3D12_RANGE</a> structure that describes the range of memory to access.
     * 
     * This indicates the region the CPU might read, and the coordinates are subresource-relative. A null pointer indicates the entire subresource might be read by the CPU. It is valid to specify the CPU won't read any data by passing a range where <b>End</b> is less than or equal to <b>Begin</b>.
     * @returns {Pointer<Void>} Type: <b><b>void</b>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the resource data.
     * 
     * A null pointer is valid and is useful to cache a CPU virtual address range for methods like <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-writetosubresource">WriteToSubresource</a>. When <i>ppData</i> is not NULL, the pointer returned is never offset by any values in <i>pReadRange</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12resource-map
     */
    Map(Subresource, pReadRange) {
        result := ComCall(8, this, "uint", Subresource, "ptr", pReadRange, "ptr*", &ppData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppData
    }

    /**
     * Invalidates the CPU pointer to the specified subresource in the resource.
     * @remarks
     * Refer to the extensive Remarks and Examples for the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-map">Map</a> method.
     * @param {Integer} Subresource Type: <b>UINT</b>
     * 
     * Specifies the index of the subresource.
     * @param {Pointer<D3D12_RANGE>} pWrittenRange Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_range">D3D12_RANGE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_range">D3D12_RANGE</a> structure that describes the range of memory to unmap.
     * 
     * This indicates the region the CPU might have modified, and the coordinates are subresource-relative. A null pointer indicates the entire subresource might have been modified by the CPU. It is valid to specify the CPU didn't write any data by passing a range where <b>End</b> is less than or equal to <b>Begin</b>.
     * 
     * This parameter is only used by tooling, and not for correctness of the actual unmap operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12resource-unmap
     */
    Unmap(Subresource, pWrittenRange) {
        ComCall(9, this, "uint", Subresource, "ptr", pWrittenRange)
    }

    /**
     * Gets the resource description.
     * @returns {D3D12_RESOURCE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a></b>
     * 
     * A Direct3D 12 resource description structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12resource-getdesc
     */
    GetDesc() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * This method returns the GPU virtual address of a buffer resource.
     * @remarks
     * This method is only useful for buffer resources, it will return zero for all texture resources.
     * 
     * For more information on the use of GPU virtual addresses, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/indirect-drawing">Indirect Drawing</a>.
     * @returns {Integer} Type: <b>D3D12_GPU_VIRTUAL_ADDRESS</b>
     * 
     * This method returns the GPU virtual address.
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd synonym of UINT64.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12resource-getgpuvirtualaddress
     */
    GetGPUVirtualAddress() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * Uses the CPU to copy data into a subresource, enabling the CPU to modify the contents of most textures with undefined layouts.
     * @remarks
     * The resource should first be mapped using
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-map">Map</a>. Textures must be in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_COMMON</a> state for CPU access through <b>WriteToSubresource</b> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-readfromsubresource">ReadFromSubresource</a> to be legal; but buffers do not.
     * 
     * For efficiency, ensure the bounds and alignment of the extents within the box are ( 64 / [bytes per pixel] ) pixels horizontally.
     *           Vertical bounds and alignment should be 2 rows, except when 1-byte-per-pixel formats are used, in which case 4 rows are recommended.
     *           Single depth slices per call are handled efficiently.
     *           It is recommended but not necessary to provide pointers and strides which are 128-byte aligned.
     *         
     * 
     * When writing to sub mipmap levels, it is recommended to use larger width and heights than described above.
     *           This is because small mipmap levels may actually be stored within a larger block of memory, with an opaque amount of offsetting which can interfere with alignment to cache lines.
     *         
     * 
     * <b>WriteToSubresource</b> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-readfromsubresource">ReadFromSubresource</a> enable near zero-copy optimizations for UMA adapters, but can prohibitively impair the efficiency of discrete/ NUMA adapters as the texture data cannot reside in local video memory. Typical applications should stick to discrete-friendly upload techniques, unless they recognize the adapter architecture is UMA. For more details on uploading, refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">CopyTextureRegion</a>, and for more details on UMA, refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_architecture">D3D12_FEATURE_DATA_ARCHITECTURE</a>. 
     * 
     * On UMA systems, this routine can be used to minimize the cost of memory copying through the loop optimization known as <a href="https://en.wikipedia.org/wiki/Loop_tiling">loop tiling</a>. By breaking up the upload into chucks that comfortably fit in the CPU cache, the effective bandwidth between the CPU and main memory more closely achieves theoretical maximums.
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the index of the subresource.
     * @param {Pointer<D3D12_BOX>} pDstBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_box">D3D12_BOX</a>*</b>
     * 
     * A pointer to a box that defines the portion of the destination subresource to copy the resource data into.
     *               If NULL, the data is written to the destination subresource with no offset.
     *               The dimensions of the source must fit the destination (see
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_box">D3D12_BOX</a>).
     *             
     * 
     * An empty box results in a no-op.
     *               A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, 
     * 				  or the front value is greater than or equal to the back value.
     *               When the box is empty, this method doesn't perform any operation.
     * @param {Pointer<Void>} pSrcData Type: <b>const void*</b>
     * 
     * A pointer to the source data in memory.
     * @param {Integer} SrcRowPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The distance from one row of source data to the next row.
     * @param {Integer} SrcDepthPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The distance from one depth slice of source data to the next.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12resource-writetosubresource
     */
    WriteToSubresource(DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, "uint", DstSubresource, "ptr", pDstBox, pSrcDataMarshal, pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Uses the CPU to copy data from a subresource, enabling the CPU to read the contents of most textures with undefined layouts.
     * @remarks
     * See the Remarks section for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-writetosubresource">WriteToSubresource</a>.
     * @param {Integer} DstRowPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The distance from one row of destination data to the next row.
     * @param {Integer} DstDepthPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The distance from one depth slice of destination data to the next.
     * @param {Integer} SrcSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the index of the subresource to read from.
     * @param {Pointer<D3D12_BOX>} pSrcBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_box">D3D12_BOX</a>*</b>
     * 
     * A pointer to a box that defines the portion of the destination subresource to copy the resource data from.
     *               If NULL, the data is read from the destination subresource with no offset.
     *               The dimensions of the destination must fit the destination (see
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_box">D3D12_BOX</a>).
     *             
     * 
     * An empty box results in a no-op.
     *               A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, or the front value is greater than or equal to the back value.
     *               When the box is empty, this method doesn't perform any operation.
     * @returns {Void} Type: <b>void*</b>
     * 
     * A pointer to the destination data in memory.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12resource-readfromsubresource
     */
    ReadFromSubresource(DstRowPitch, DstDepthPitch, SrcSubresource, pSrcBox) {
        result := ComCall(13, this, "ptr", &pDstData := 0, "uint", DstRowPitch, "uint", DstDepthPitch, "uint", SrcSubresource, "ptr", pSrcBox, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDstData
    }

    /**
     * Retrieves the properties of the resource heap, for placed and committed resources.
     * @remarks
     * This method only works on placed and committed resources, not on reserved resources.
     *           If the resource was created as reserved, E_INVALIDARG is returned.
     *           The pages could be mapped to none, one, or more heaps.
     *         
     * 
     * For more information, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/memory-management">Memory Management in Direct3D 12</a>.
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a> structure, that on successful completion of the method will contain the resource heap properties.
     * @param {Pointer<Integer>} pHeapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_heap_flags">D3D12_HEAP_FLAGS</a>*</b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_heap_flags">D3D12_HEAP_FLAGS</a> variable, that on successful completion of the method will contain any miscellaneous heap flags.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     *             If the resource was created as reserved, E_INVALIDARG is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12resource-getheapproperties
     */
    GetHeapProperties(pHeapProperties, pHeapFlags) {
        pHeapFlagsMarshal := pHeapFlags is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", pHeapProperties, pHeapFlagsMarshal, pHeapFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
