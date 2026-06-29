#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
class MODULEENTRY extends Win32Struct {
    static sizeof => 288

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
        get => StrGet(this.ptr + 4, 9, "UTF-8")
        set => StrPut(value, this.ptr + 4, 9, "UTF-8")
    }

    /**
     * @type {HANDLE}
     */
    hModule {
        get {
            if(!this.HasProp("__hModule"))
                this.__hModule := HANDLE(16, this)
            return this.__hModule
        }
    }

    /**
     * @type {Integer}
     */
    wcUsage {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {String}
     */
    szExePath {
        get => StrGet(this.ptr + 26, 255, "UTF-8")
        set => StrPut(value, this.ptr + 26, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    wNext {
        get => NumGet(this, 282, "ushort")
        set => NumPut("ushort", value, this, 282)
    }
}
