#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoencoderheap
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncoderHeap extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoEncoderHeap
     * @type {Guid}
     */
    static IID => Guid("{22b35d96-876a-44c0-b25e-fb8c9c7f1c4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeMask", "GetEncoderHeapFlags", "GetCodec", "GetCodecProfile", "GetCodecLevel", "GetResolutionListCount", "GetResolutionList"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getnodemask
     */
    GetNodeMask() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getencoderheapflags
     */
    GetEncoderHeapFlags() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodec
     */
    GetCodec() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @param {D3D12_VIDEO_ENCODER_PROFILE_DESC} dstProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodecprofile
     */
    GetCodecProfile(dstProfile) {
        result := ComCall(11, this, "ptr", dstProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D3D12_VIDEO_ENCODER_LEVEL_SETTING} dstLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodeclevel
     */
    GetCodecLevel(dstLevel) {
        result := ComCall(12, this, "ptr", dstLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getresolutionlistcount
     */
    GetResolutionListCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ResolutionsListCount 
     * @param {Pointer<D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC>} pResolutionList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getresolutionlist
     */
    GetResolutionList(ResolutionsListCount, pResolutionList) {
        result := ComCall(14, this, "uint", ResolutionsListCount, "ptr", pResolutionList, "HRESULT")
        return result
    }
}
