#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION_SUPPORT.ahk" { D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION_SUPPORT }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264 }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC1.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC1 }

/**
 * Represents a codec configuration support structure for video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT {
    #StructPack 8

    /**
     * The data size of the provided codec configuration support structure.
     */
    DataSize : UInt32

    pH264Support : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pHEVCSupport', { type: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pHEVCSupport1', { type: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC1.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pAV1Support', { type: D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION_SUPPORT.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
