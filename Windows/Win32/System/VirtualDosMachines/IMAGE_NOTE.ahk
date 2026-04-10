#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
class IMAGE_NOTE extends Win32Struct {
    static sizeof => 270

    static packingSize => 2

    /**
     * @type {String}
     */
    Module {
        get => StrGet(this.ptr + 0, 9, "UTF-8")
        set => StrPut(value, this.ptr + 0, 9, "UTF-8")
    }

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 10, 255, "UTF-8")
        set => StrPut(value, this.ptr + 10, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    hModule {
        get => NumGet(this, 266, "ushort")
        set => NumPut("ushort", value, this, 266)
    }

    /**
     * @type {Integer}
     */
    hTask {
        get => NumGet(this, 268, "ushort")
        set => NumPut("ushort", value, this, 268)
    }
}
