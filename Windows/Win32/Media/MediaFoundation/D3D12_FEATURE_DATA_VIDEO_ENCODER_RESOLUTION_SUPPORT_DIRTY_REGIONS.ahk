#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAGS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_DIRTY_REGIONS extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAGS}
     */
    DirtyRegionsSupportFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MapSourcePreferenceRanking {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
