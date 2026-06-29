#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS.ahk" { D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION {
    #StructPack 4

    FeatureFlags : D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS

    OrderHintBitsMinus1 : UInt32

}
