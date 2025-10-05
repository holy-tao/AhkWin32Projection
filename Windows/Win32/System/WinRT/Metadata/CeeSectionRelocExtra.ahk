#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CeeSectionRelocExtra extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * @type {Integer}
     */
    highAdj {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
