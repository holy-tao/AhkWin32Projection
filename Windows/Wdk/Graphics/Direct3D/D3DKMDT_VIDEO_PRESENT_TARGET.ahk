#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_VIDEO_OUTPUT_TECHNOLOGY.ahk
#Include .\DXGK_CHILD_DEVICE_HPD_AWARENESS.ahk
#Include .\D3DKMDT_MONITOR_ORIENTATION_AWARENESS.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDEO_PRESENT_TARGET extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DKMDT_VIDEO_OUTPUT_TECHNOLOGY}
     */
    VideoOutputTechnology {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {DXGK_CHILD_DEVICE_HPD_AWARENESS}
     */
    VideoOutputHpdAwareness {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {D3DKMDT_MONITOR_ORIENTATION_AWARENESS}
     */
    MonitorOrientationAwareness {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    SupportsSdtvModes {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
