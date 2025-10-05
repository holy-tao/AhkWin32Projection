#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class COMPONENT_FILTER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ComponentFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
