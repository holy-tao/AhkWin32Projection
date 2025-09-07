#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about the shared resource, including the name and type of the resource, and a comment associated with the resource.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the share name of a resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {PWSTR}
     */
    shi1_netname{
        get {
            if(!this.HasProp("__shi1_netname"))
                this.__shi1_netname := PWSTR(this.ptr + 0)
            return this.__shi1_netname
        }
    }

    /**
     * A combination of values that specify the type of the shared resource. Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     * @type {Integer}
     */
    shi1_type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a Unicode string specifying an optional comment about the shared resource.
     * @type {PWSTR}
     */
    shi1_remark{
        get {
            if(!this.HasProp("__shi1_remark"))
                this.__shi1_remark := PWSTR(this.ptr + 16)
            return this.__shi1_remark
        }
    }
}
