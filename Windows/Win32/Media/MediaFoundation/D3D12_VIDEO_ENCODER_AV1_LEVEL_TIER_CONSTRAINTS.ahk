#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_AV1_LEVELS.ahk" { D3D12_VIDEO_ENCODER_AV1_LEVELS }
#Import ".\D3D12_VIDEO_ENCODER_AV1_TIER.ahk" { D3D12_VIDEO_ENCODER_AV1_TIER }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS {
    #StructPack 4

    Level : D3D12_VIDEO_ENCODER_AV1_LEVELS

    Tier : D3D12_VIDEO_ENCODER_AV1_TIER

}
