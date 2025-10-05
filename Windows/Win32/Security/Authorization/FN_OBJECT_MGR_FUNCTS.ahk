#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class FN_OBJECT_MGR_FUNCTS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Placeholder {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
