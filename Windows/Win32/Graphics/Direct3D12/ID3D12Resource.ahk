#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Encapsulates a generalized ability of the CPU and GPU to read and write to physical memory, or heaps. It contains abstractions for organizing and manipulating simple arrays of data as well as multidimensional data optimized for shader sampling.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12resource
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12resource-map
     */
    Map(Subresource, pReadRange) {
        result := ComCall(8, this, "uint", Subresource, "ptr", pReadRange, "ptr*", &ppData := 0, "HRESULT")
        return ppData
    }

    /**
     * Invalidates the CPU pointer to the specified subresource in the resource. Unmap also flushes the CPU cache, when necessary, so that GPU reads to this address reflect any modifications made by the CPU.
     * @remarks
     * 
     * Refer to the extensive Remarks and Examples for the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-map">Map</a> method.
     * 
     * 
     * @param {Integer} Subresource Type: <b>UINT</b>
     * 
     * Specifies the index of the subresource.
     * @param {Pointer<D3D12_RANGE>} pWrittenRange Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_range">D3D12_RANGE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_range">D3D12_RANGE</a> structure that describes the range of memory to unmap.
     * 
     * This indicates the region the CPU might have modified, and the coordinates are subresource-relative. A null pointer indicates the entire subresource might have been modified by the CPU. It is valid to specify the CPU didn't write any data by passing a range where <b>End</b> is less than or equal to <b>Begin</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12resource-unmap
     */
    Unmap(Subresource, pWrittenRange) {
        ComCall(9, this, "uint", Subresource, "ptr", pWrittenRange)
    }

    /**
     * Gets the resource description.
     * @returns {D3D12_RESOURCE_DESC} Type: <b><a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a></b>
     * 
     * A Direct3D 12 resource description structure.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12resource-getdesc
     */
    GetDesc() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * This method returns the GPU virtual address of a buffer resource.
     * @returns {Integer} Type: <b>D3D12_GPU_VIRTUAL_ADDRESS</b>
     * 
     * This method returns the GPU virtual address.
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd synonym of UINT64.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12resource-getgpuvirtualaddress
     */
    GetGPUVirtualAddress() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * Uses the CPU to copy data into a subresource, enabling the CPU to modify the contents of most textures with undefined layouts.
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12resource-writetosubresource
     */
    WriteToSubresource(DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, "uint", DstSubresource, "ptr", pDstBox, pSrcDataMarshal, pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch, "HRESULT")
        return result
    }

    /**
     * Uses the CPU to copy data from a subresource, enabling the CPU to read the contents of most textures with undefined layouts.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12resource-readfromsubresource
     */
    ReadFromSubresource(DstRowPitch, DstDepthPitch, SrcSubresource, pSrcBox) {
        result := ComCall(13, this, "ptr", &pDstData := 0, "uint", DstRowPitch, "uint", DstDepthPitch, "uint", SrcSubresource, "ptr", pSrcBox, "HRESULT")
        return pDstData
    }

    /**
     * Retrieves the properties of the resource heap, for placed and committed resources.
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a> structure, that on successful completion of the method will contain the resource heap properties.
     * @param {Pointer<Integer>} pHeapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_heap_flags">D3D12_HEAP_FLAGS</a>*</b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_heap_flags">D3D12_HEAP_FLAGS</a> variable, that on successful completion of the method will contain any miscellaneous heap flags.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     *             If the resource was created as reserved, E_INVALIDARG is returned.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12resource-getheapproperties
     */
    GetHeapProperties(pHeapProperties, pHeapFlags) {
        pHeapFlagsMarshal := pHeapFlags is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", pHeapProperties, pHeapFlagsMarshal, pHeapFlags, "HRESULT")
        return result
    }
}
