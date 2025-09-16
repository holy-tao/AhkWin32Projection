#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class MODULEENTRY extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

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
    szModule {
        get => StrGet(this.ptr + 4, 9, "UTF-16")
        set => StrPut(value, this.ptr + 4, 9, "UTF-16")
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    hModule {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    wcUsage {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {String}
     */
    szExePath {
        get => StrGet(this.ptr + 34, 255, "UTF-16")
        set => StrPut(value, this.ptr + 34, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    wNext {
        get => NumGet(this, 546, "ushort")
        set => NumPut("ushort", value, this, 546)
    }
}
