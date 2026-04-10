#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS}
     */
    FeatureFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OrderHintBitsMinus1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
