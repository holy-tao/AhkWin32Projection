#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a comment associated with the shared resource.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1004
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_1004 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains an optional comment about the shared resource.
     * @type {Pointer<Char>}
     */
    shi1004_remark {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
