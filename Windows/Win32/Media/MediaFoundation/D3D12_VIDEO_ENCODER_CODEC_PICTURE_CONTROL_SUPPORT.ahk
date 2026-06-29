#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_HEVC.ahk" { D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_AV1_PICTURE_CONTROL_SUPPORT.ahk" { D3D12_VIDEO_ENCODER_CODEC_AV1_PICTURE_CONTROL_SUPPORT }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264.ahk" { D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264 }

/**
 * Represents picture control support structure for multiple codecs.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_picture_control_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT {
    #StructPack 8

    /**
     * The data size of the provided picture control support structure.
     */
    DataSize : UInt32

    pH264Support : D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pHEVCSupport', { type: D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_HEVC.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pAV1Support', { type: D3D12_VIDEO_ENCODER_CODEC_AV1_PICTURE_CONTROL_SUPPORT.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
