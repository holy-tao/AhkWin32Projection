#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_VIDEO_SIGNAL_STANDARD.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_TARGETMODE_DETAIL_TIMING extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {D3DKMDT_VIDEO_SIGNAL_STANDARD}
     */
    VideoStandard {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TimingId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    DetailTiming {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
