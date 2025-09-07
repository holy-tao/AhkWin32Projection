#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class IMAGE_NOTE extends Win32Struct
{
    static sizeof => 536

    static packingSize => 2

    /**
     * @type {String}
     */
    Module {
        get => StrGet(this.ptr + 0, 9, "UTF-16")
        set => StrPut(value, this.ptr + 0, 9, "UTF-16")
    }

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 20, 255, "UTF-16")
        set => StrPut(value, this.ptr + 20, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    hModule {
        get => NumGet(this, 532, "ushort")
        set => NumPut("ushort", value, this, 532)
    }

    /**
     * @type {Integer}
     */
    hTask {
        get => NumGet(this, 534, "ushort")
        set => NumPut("ushort", value, this, 534)
    }
}
