#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE.ahk" { D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_FLAGS.ahk" { D3D12_VIDEO_ENCODER_FLAGS }
#Import "..\..\Graphics\Direct3D12\ID3D12Pageable.ahk" { ID3D12Pageable }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }

/**
 * Represents a Direct3D 12 video encoder.
 * @remarks
 * Get an instance of this class by calling [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoencoder
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoEncoder extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12VideoEncoder
     * @type {Guid}
     */
    static IID := Guid("{2e0d212d-8df9-44a6-a770-bb289b182737}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoEncoder interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetNodeMask                     : IntPtr
        GetEncoderFlags                 : IntPtr
        GetCodec                        : IntPtr
        GetCodecProfile                 : IntPtr
        GetCodecConfiguration           : IntPtr
        GetInputFormat                  : IntPtr
        GetMaxMotionEstimationPrecision : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoEncoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the node mask for the video encoder.
     * @returns {Integer} The node mask value specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getnodemask
     */
    GetNodeMask() {
        result := ComCall(8, this, UInt32)
        return result
    }

    /**
     * Gets the encoder flags with which the video encoder was initialized.
     * @returns {D3D12_VIDEO_ENCODER_FLAGS} The bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_FLAGS](ne-d3d12video-d3d12_video_encoder_flags.md) enumeration specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getencoderflags
     */
    GetEncoderFlags() {
        result := ComCall(9, this, D3D12_VIDEO_ENCODER_FLAGS)
        return result
    }

    /**
     * Gets the codec associated with the video encoder.
     * @returns {D3D12_VIDEO_ENCODER_CODEC} The value from the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getcodec
     */
    GetCodec() {
        result := ComCall(10, this, D3D12_VIDEO_ENCODER_CODEC)
        return result
    }

    /**
     * Gets the codec profile associated with the video encoder.
     * @param {D3D12_VIDEO_ENCODER_PROFILE_DESC} dstProfile Receives a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure representing the codec profile specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getcodecprofile
     */
    GetCodecProfile(dstProfile) {
        result := ComCall(11, this, D3D12_VIDEO_ENCODER_PROFILE_DESC, dstProfile, "HRESULT")
        return result
    }

    /**
     * Gets the codec configuration parameters associated with the video encoder.
     * @param {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION} dstCodecConfig Receives a [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION](ns-d3d12video-d3d12_video_encoder_codec_configuration.md) structure representing the codec configuration parameters specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getcodecconfiguration
     */
    GetCodecConfiguration(dstCodecConfig) {
        result := ComCall(12, this, D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION, dstCodecConfig, "HRESULT")
        return result
    }

    /**
     * Gets the input format of the video encoder.
     * @returns {DXGI_FORMAT} The [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) value specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getinputformat
     */
    GetInputFormat() {
        result := ComCall(13, this, DXGI_FORMAT)
        return result
    }

    /**
     * Gets the maximum motion estimation precision of the video encoder.
     * @returns {D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE} The value from the [D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE](ne-d3d12video-d3d12_video_encoder_motion_estimation_precision_mode.md) enumeration specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getmaxmotionestimationprecision
     */
    GetMaxMotionEstimationPrecision() {
        result := ComCall(14, this, D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE)
        return result
    }

    Query(iid) {
        if (ID3D12VideoEncoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNodeMask := CallbackCreate(GetMethod(implObj, "GetNodeMask"), flags, 1)
        this.vtbl.GetEncoderFlags := CallbackCreate(GetMethod(implObj, "GetEncoderFlags"), flags, 1)
        this.vtbl.GetCodec := CallbackCreate(GetMethod(implObj, "GetCodec"), flags, 1)
        this.vtbl.GetCodecProfile := CallbackCreate(GetMethod(implObj, "GetCodecProfile"), flags, 2)
        this.vtbl.GetCodecConfiguration := CallbackCreate(GetMethod(implObj, "GetCodecConfiguration"), flags, 2)
        this.vtbl.GetInputFormat := CallbackCreate(GetMethod(implObj, "GetInputFormat"), flags, 1)
        this.vtbl.GetMaxMotionEstimationPrecision := CallbackCreate(GetMethod(implObj, "GetMaxMotionEstimationPrecision"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNodeMask)
        CallbackFree(this.vtbl.GetEncoderFlags)
        CallbackFree(this.vtbl.GetCodec)
        CallbackFree(this.vtbl.GetCodecProfile)
        CallbackFree(this.vtbl.GetCodecConfiguration)
        CallbackFree(this.vtbl.GetInputFormat)
        CallbackFree(this.vtbl.GetMaxMotionEstimationPrecision)
    }
}
