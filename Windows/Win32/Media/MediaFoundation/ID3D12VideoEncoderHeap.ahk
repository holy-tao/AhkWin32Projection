#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * Represents a Direct3D 12 video encoder heap.
 * @remarks
 * Get an instance of this class by calling [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md)
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videoencoderheap
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
     * Gets the node mask for the video encoder heap.
     * @returns {Integer} The node mask value specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoderheap-getnodemask
     */
    GetNodeMask() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * Gets the encoder heap flags with which the video encoder heap was initialized.
     * @returns {Integer} The bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_HEAP_FLAGS](ne-d3d12video-d3d12_video_encoder_heap_flags.md) enumeration specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoderheap-getencoderheapflags
     */
    GetEncoderHeapFlags() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * Gets the codec associated with the video encoder heap.
     * @returns {Integer} The value from the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodec
     */
    GetCodec() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * Gets the codec profile associated with the video encoder heap.
     * @param {D3D12_VIDEO_ENCODER_PROFILE_DESC} dstProfile Receives a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure representing the codec profile specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodecprofile
     */
    GetCodecProfile(dstProfile) {
        result := ComCall(11, this, "ptr", dstProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the codec level associated with the video encoder heap.
     * @param {D3D12_VIDEO_ENCODER_LEVEL_SETTING} dstLevel Receives a [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) structure representing the codec profile specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodeclevel
     */
    GetCodecLevel(dstLevel) {
        result := ComCall(12, this, "ptr", dstLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ID3D12VideoEncoderHeap::GetResolutionListCount method (d3d12video.h) gets the resolution list count associated with the video encoder heap.
     * @returns {Integer} The size of the resolution list provided in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoderheap-getresolutionlistcount
     */
    GetResolutionListCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * Gets the resolution list associated with the video encoder heap.
     * @param {Integer} ResolutionsListCount The count of resolutions to retrieve. Get the number of resolutions with which the encoder heap was created by calling [ID3D12VideoEncoderHeap::GetResolutionListCount](nf-d3d12video-id3d12videoencoderheap-getresolutionlistcount.md).
     * @returns {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC} Receives a pointer to an array of [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) structures representing the resolutions specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoderheap-getresolutionlist
     */
    GetResolutionList(ResolutionsListCount) {
        pResolutionList := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC()
        result := ComCall(14, this, "uint", ResolutionsListCount, "ptr", pResolutionList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResolutionList
    }
}
