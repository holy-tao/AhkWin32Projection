#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KMT_DISPLAY_UMD_VERSION.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DISPLAY_UMD_FILENAMEINFO extends Win32Struct {
    static sizeof => 524

    static packingSize => 4

    /**
     * @type {KMT_DISPLAY_UMD_VERSION}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {String}
     */
    UmdFileName {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }
}
