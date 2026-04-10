#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_COLOR_BASIS.ahk
#Include .\D3DKMDT_MONITOR_CAPABILITIES_ORIGIN.ahk
#Include .\D3DKMDT_MODE_PREFERENCE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_SOURCE_MODE extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    VideoSignalInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {D3DKMDT_COLOR_BASIS}
     */
    ColorBasis {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    ColorCoeffDynamicRanges {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {D3DKMDT_MONITOR_CAPABILITIES_ORIGIN}
     */
    Origin {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {D3DKMDT_MODE_PREFERENCE}
     */
    Preference {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
