#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_INFO_1049 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    wki1049_use_unlock_behind {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
