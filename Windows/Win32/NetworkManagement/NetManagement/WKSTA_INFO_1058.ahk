#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_INFO_1058 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    wki1058_buf_files_deny_write {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
