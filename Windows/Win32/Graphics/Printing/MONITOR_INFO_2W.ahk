#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class MONITOR_INFO_2W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pEnvironment {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pDLLName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
