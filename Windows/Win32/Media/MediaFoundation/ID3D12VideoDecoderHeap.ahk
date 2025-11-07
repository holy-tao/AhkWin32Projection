#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * Represents a Direct3D 12 video decoder heap.
 * @remarks
 * 
 * Get an instance of this class by calling [ID3D12VideoDevice::CreateVideoDecoderHeap](nf-d3d12video-id3d12videodevice-createvideodecoderheap.md).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videodecoderheap
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDecoderHeap extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDecoderHeap
     * @type {Guid}
     */
    static IID => Guid("{0946b7c9-ebf6-4047-bb73-8683e27dbb1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @returns {D3D12_VIDEO_DECODER_HEAP_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecoderheap-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }
}
