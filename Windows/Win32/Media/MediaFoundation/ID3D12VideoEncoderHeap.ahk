#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC }
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk" { D3D12_VIDEO_ENCODER_LEVEL_SETTING }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_VIDEO_ENCODER_HEAP_FLAGS.ahk" { D3D12_VIDEO_ENCODER_HEAP_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import "..\..\Graphics\Direct3D12\ID3D12Pageable.ahk" { ID3D12Pageable }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }

/**
 * Represents a Direct3D 12 video encoder heap.
 * @remarks
 * Get an instance of this class by calling [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoencoderheap
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoEncoderHeap extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12VideoEncoderHeap
     * @type {Guid}
     */
    static IID := Guid("{22b35d96-876a-44c0-b25e-fb8c9c7f1c4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoEncoderHeap interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetNodeMask            : IntPtr
        GetEncoderHeapFlags    : IntPtr
        GetCodec               : IntPtr
        GetCodecProfile        : IntPtr
        GetCodecLevel          : IntPtr
        GetResolutionListCount : IntPtr
        GetResolutionList      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoEncoderHeap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the node mask for the video encoder heap.
     * @returns {Integer} The node mask value specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getnodemask
     */
    GetNodeMask() {
        result := ComCall(8, this, UInt32)
        return result
    }

    /**
     * Gets the encoder heap flags with which the video encoder heap was initialized.
     * @returns {D3D12_VIDEO_ENCODER_HEAP_FLAGS} The bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_HEAP_FLAGS](ne-d3d12video-d3d12_video_encoder_heap_flags.md) enumeration specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getencoderheapflags
     */
    GetEncoderHeapFlags() {
        result := ComCall(9, this, D3D12_VIDEO_ENCODER_HEAP_FLAGS)
        return result
    }

    /**
     * Gets the codec associated with the video encoder heap.
     * @returns {D3D12_VIDEO_ENCODER_CODEC} The value from the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodec
     */
    GetCodec() {
        result := ComCall(10, this, D3D12_VIDEO_ENCODER_CODEC)
        return result
    }

    /**
     * Gets the codec profile associated with the video encoder heap.
     * @param {D3D12_VIDEO_ENCODER_PROFILE_DESC} dstProfile Receives a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure representing the codec profile specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodecprofile
     */
    GetCodecProfile(dstProfile) {
        result := ComCall(11, this, D3D12_VIDEO_ENCODER_PROFILE_DESC, dstProfile, "HRESULT")
        return result
    }

    /**
     * Gets the codec level associated with the video encoder heap.
     * @param {D3D12_VIDEO_ENCODER_LEVEL_SETTING} dstLevel Receives a [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) structure representing the codec profile specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getcodeclevel
     */
    GetCodecLevel(dstLevel) {
        result := ComCall(12, this, D3D12_VIDEO_ENCODER_LEVEL_SETTING, dstLevel, "HRESULT")
        return result
    }

    /**
     * The ID3D12VideoEncoderHeap::GetResolutionListCount method (d3d12video.h) gets the resolution list count associated with the video encoder heap.
     * @returns {Integer} The size of the resolution list provided in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getresolutionlistcount
     */
    GetResolutionListCount() {
        result := ComCall(13, this, UInt32)
        return result
    }

    /**
     * Gets the resolution list associated with the video encoder heap.
     * @param {Integer} ResolutionsListCount The count of resolutions to retrieve. Get the number of resolutions with which the encoder heap was created by calling [ID3D12VideoEncoderHeap::GetResolutionListCount](nf-d3d12video-id3d12videoencoderheap-getresolutionlistcount.md).
     * @returns {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC} Receives a pointer to an array of [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) structures representing the resolutions specified in the [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoderHeap](nf-d3d12video-id3d12videodevice3-createvideoencoderheap.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoderheap-getresolutionlist
     */
    GetResolutionList(ResolutionsListCount) {
        pResolutionList := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC()
        result := ComCall(14, this, "uint", ResolutionsListCount, D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.Ptr, pResolutionList, "HRESULT")
        return pResolutionList
    }

    Query(iid) {
        if (ID3D12VideoEncoderHeap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNodeMask := CallbackCreate(GetMethod(implObj, "GetNodeMask"), flags, 1)
        this.vtbl.GetEncoderHeapFlags := CallbackCreate(GetMethod(implObj, "GetEncoderHeapFlags"), flags, 1)
        this.vtbl.GetCodec := CallbackCreate(GetMethod(implObj, "GetCodec"), flags, 1)
        this.vtbl.GetCodecProfile := CallbackCreate(GetMethod(implObj, "GetCodecProfile"), flags, 2)
        this.vtbl.GetCodecLevel := CallbackCreate(GetMethod(implObj, "GetCodecLevel"), flags, 2)
        this.vtbl.GetResolutionListCount := CallbackCreate(GetMethod(implObj, "GetResolutionListCount"), flags, 1)
        this.vtbl.GetResolutionList := CallbackCreate(GetMethod(implObj, "GetResolutionList"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNodeMask)
        CallbackFree(this.vtbl.GetEncoderHeapFlags)
        CallbackFree(this.vtbl.GetCodec)
        CallbackFree(this.vtbl.GetCodecProfile)
        CallbackFree(this.vtbl.GetCodecLevel)
        CallbackFree(this.vtbl.GetResolutionListCount)
        CallbackFree(this.vtbl.GetResolutionList)
    }
}
