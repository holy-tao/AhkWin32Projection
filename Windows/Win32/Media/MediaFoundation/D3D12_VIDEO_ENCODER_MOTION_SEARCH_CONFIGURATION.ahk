#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    Enabled {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MapSource {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MotionSearchMode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    BidirectionalRefFrameEnabled {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
