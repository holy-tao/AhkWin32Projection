#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_QPMAP extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MapSourcePreferenceRanking {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
