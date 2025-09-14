#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the shared resource including the name and type of the resource, and a comment associated with the resource.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_501
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_501 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the name of a shared resource.
     * @type {Pointer<PWSTR>}
     */
    shi501_netname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A combination of values that specify the type of share.
     * @type {Integer}
     */
    shi501_type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a Unicode string specifying an optional comment about the shared resource.
     * @type {Pointer<PWSTR>}
     */
    shi501_remark {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    shi501_flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
