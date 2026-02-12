#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * Represents a Direct3D 12 video encoder.
 * @remarks
 * Get an instance of this class by calling [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videoencoder
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncoder extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoEncoder
     * @type {Guid}
     */
    static IID => Guid("{2e0d212d-8df9-44a6-a770-bb289b182737}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeMask", "GetEncoderFlags", "GetCodec", "GetCodecProfile", "GetCodecConfiguration", "GetInputFormat", "GetMaxMotionEstimationPrecision"]

    /**
     * Gets the node mask for the video encoder.
     * @returns {Integer} The node mask value specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoder-getnodemask
     */
    GetNodeMask() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * Gets the encoder flags with which the video encoder was initialized.
     * @returns {Integer} The bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_FLAGS](ne-d3d12video-d3d12_video_encoder_flags.md) enumeration specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoder-getencoderflags
     */
    GetEncoderFlags() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * Gets the codec associated with the video encoder.
     * @returns {Integer} The value from the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoder-getcodec
     */
    GetCodec() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * Gets the codec profile associated with the video encoder.
     * @param {D3D12_VIDEO_ENCODER_PROFILE_DESC} dstProfile Receives a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure representing the codec profile specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoder-getcodecprofile
     */
    GetCodecProfile(dstProfile) {
        result := ComCall(11, this, "ptr", dstProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the codec configuration parameters associated with the video encoder.
     * @param {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION} dstCodecConfig Receives a [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION](ns-d3d12video-d3d12_video_encoder_codec_configuration.md) structure representing the codec configuration parameters specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoder-getcodecconfiguration
     */
    GetCodecConfiguration(dstCodecConfig) {
        result := ComCall(12, this, "ptr", dstCodecConfig, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the input format of the video encoder.
     * @returns {Integer} The [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) value specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoder-getinputformat
     */
    GetInputFormat() {
        result := ComCall(13, this, "int")
        return result
    }

    /**
     * Gets the maximum motion estimation precision of the video encoder.
     * @returns {Integer} The value from the [D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE](ne-d3d12video-d3d12_video_encoder_motion_estimation_precision_mode.md) enumeration specified in the [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) passed into [ID3D12VideoDevice3::CreateVideoEncoder](nf-d3d12video-id3d12videodevice3-createvideoencoder.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencoder-getmaxmotionestimationprecision
     */
    GetMaxMotionEstimationPrecision() {
        result := ComCall(14, this, "int")
        return result
    }
}
