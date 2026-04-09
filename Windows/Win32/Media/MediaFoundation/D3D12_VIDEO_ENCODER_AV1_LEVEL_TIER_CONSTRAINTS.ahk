#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_LEVELS.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_TIER.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_LEVELS}
     */
    Level {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_TIER}
     */
    Tier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
