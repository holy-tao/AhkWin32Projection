#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_lsn
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_LSN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Internal {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
