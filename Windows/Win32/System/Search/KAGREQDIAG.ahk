#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Variant\VARENUM.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class KAGREQDIAG extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulDiagFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VARENUM}
     */
    vt {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    sDiagField {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }
}
