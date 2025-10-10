#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_FRAME_SUBREGION_METADATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    bSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bStartOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bHeaderSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
