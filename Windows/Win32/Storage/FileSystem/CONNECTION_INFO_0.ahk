#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the identification number of a connection.
 * @see https://docs.microsoft.com/windows/win32/api//lmshare/ns-lmshare-connection_info_0
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CONNECTION_INFO_0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a connection identification number.
     * @type {Integer}
     */
    coni0_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
