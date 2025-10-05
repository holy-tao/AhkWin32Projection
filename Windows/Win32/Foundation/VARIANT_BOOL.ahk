#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class VARIANT_BOOL extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }
}
