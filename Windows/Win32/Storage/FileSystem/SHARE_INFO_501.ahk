#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    shi501_netname{
        get {
            if(!this.HasProp("__shi501_netname"))
                this.__shi501_netname := PWSTR(this.ptr + 0)
            return this.__shi501_netname
        }
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
     * @type {PWSTR}
     */
    shi501_remark{
        get {
            if(!this.HasProp("__shi501_remark"))
                this.__shi501_remark := PWSTR(this.ptr + 16)
            return this.__shi501_remark
        }
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
