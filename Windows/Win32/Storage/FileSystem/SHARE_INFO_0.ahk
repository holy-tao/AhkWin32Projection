#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the name of the shared resource.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_0
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the share name of a resource.
     * @type {Pointer<Char>}
     */
    shi0_netname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
