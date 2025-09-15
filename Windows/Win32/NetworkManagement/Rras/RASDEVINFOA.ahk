#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASDEVINFOA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 4, 16, "UTF-8")
        set => StrPut(value, this.ptr + 4, 16, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 21, 128, "UTF-8")
        set => StrPut(value, this.ptr + 21, 128, "UTF-8")
    }
}
