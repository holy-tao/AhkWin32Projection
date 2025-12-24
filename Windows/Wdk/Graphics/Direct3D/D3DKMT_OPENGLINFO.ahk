#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_OPENGLINFO extends Win32Struct
{
    static sizeof => 528

    static packingSize => 4

    /**
     * @type {String}
     */
    UmdOpenGlIcdFileName {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 524, "uint")
        set => NumPut("uint", value, this, 524)
    }
}
