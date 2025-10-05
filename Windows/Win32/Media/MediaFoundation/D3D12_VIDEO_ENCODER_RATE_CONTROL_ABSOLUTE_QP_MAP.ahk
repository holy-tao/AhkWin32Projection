#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    QualityVsSpeed {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
