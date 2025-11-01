#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * Represents a Direct3D 12 video decoder.
 * @remarks
 * 
  * Get an instance of this class by calling [ID3D12VideoDevice::CreateVideoDecoder](nf-d3d12video-id3d12videodevice-createvideodecoder.md).
  * 
  * It is not necessary to recreate this object during a resolution change.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videodecoder
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDecoder extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDecoder
     * @type {Guid}
     */
    static IID => Guid("{c59b6bdc-7720-4074-a136-17a156037470}")

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
     * @returns {D3D12_VIDEO_DECODER_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecoder-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }
}
