#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYREMOTEVIDPNSOURCEFROMGDIDISPLAYNAME extends Win32Struct
{
    static sizeof => 68

    static packingSize => 4

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
    VidPnSourceId {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
