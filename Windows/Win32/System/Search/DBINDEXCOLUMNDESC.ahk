#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Storage\IndexServer\DBID.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
class DBINDEXCOLUMNDESC extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<DBID>}
     */
    pColumnID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    eIndexColOrder {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
