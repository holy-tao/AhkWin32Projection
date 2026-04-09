#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_OPENADAPTERFROMGDIDISPLAYNAME extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {String}
     */
    DeviceName {
        get => StrGet(this.ptr + 0, 31, "UTF-16")
        set => StrPut(value, this.ptr + 0, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    hAdapter {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer}
     */
    AdapterLuid {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
