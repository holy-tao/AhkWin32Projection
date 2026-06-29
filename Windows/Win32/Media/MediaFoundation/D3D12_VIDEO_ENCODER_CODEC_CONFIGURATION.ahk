#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION.ahk" { D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION }

/**
 * Represents a codec configuration structure for video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION {
    #StructPack 8

    /**
     * The data size of the provided codec configuration structure.
     */
    DataSize : UInt32

    pH264Config : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pHEVCConfig', { type: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pAV1Config', { type: D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
