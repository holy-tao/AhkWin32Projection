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
     * 
     * @param {Integer} Subresource 
     * @param {Pointer<D3D12_RANGE>} pReadRange 
     * @param {Pointer<Pointer<Void>>} ppData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12resource-map
     */
    Map(Subresource, pReadRange, ppData) {
        result := ComCall(8, this, "uint", Subresource, "ptr", pReadRange, "ptr*", ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Subresource 
     * @param {Pointer<D3D12_RANGE>} pWrittenRange 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12resource-unmap
     */
    Unmap(Subresource, pWrittenRange) {
        ComCall(9, this, "uint", Subresource, "ptr", pWrittenRange)
    }

    /**
     * 
     * @returns {D3D12_RESOURCE_DESC} 
     * @see https://learn.microsoft.com/windows/win32/direct3d12/id3d12resource-getdesc
     */
    GetDesc() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12resource-getgpuvirtualaddress
     */
    GetGPUVirtualAddress() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} DstSubresource 
     * @param {Pointer<D3D12_BOX>} pDstBox 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} SrcRowPitch 
     * @param {Integer} SrcDepthPitch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12resource-writetosubresource
     */
    WriteToSubresource(DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        result := ComCall(12, this, "uint", DstSubresource, "ptr", pDstBox, "ptr", pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pDstData 
     * @param {Integer} DstRowPitch 
     * @param {Integer} DstDepthPitch 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<D3D12_BOX>} pSrcBox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12resource-readfromsubresource
     */
    ReadFromSubresource(pDstData, DstRowPitch, DstDepthPitch, SrcSubresource, pSrcBox) {
        result := ComCall(13, this, "ptr", pDstData, "uint", DstRowPitch, "uint", DstDepthPitch, "uint", SrcSubresource, "ptr", pSrcBox, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties 
     * @param {Pointer<Integer>} pHeapFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12resource-getheapproperties
     */
    GetHeapProperties(pHeapProperties, pHeapFlags) {
        result := ComCall(14, this, "ptr", pHeapProperties, "int*", pHeapFlags, "HRESULT")
        return result
    }
}
