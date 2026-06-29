#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk" { D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk" { D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS }
#Import ".\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk" { D3D12_VIDEO_ENCODER_LEVELS_H264 }

/**
 * Represents a video encoder level setting.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_level_setting
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_LEVEL_SETTING {
    #StructPack 8

    /**
     * The data size of the provided encoder level setting.
     */
    DataSize : UInt32

    pH264LevelSetting : D3D12_VIDEO_ENCODER_LEVELS_H264.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pHEVCLevelSetting', { type: D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pAV1LevelSetting', { type: D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
