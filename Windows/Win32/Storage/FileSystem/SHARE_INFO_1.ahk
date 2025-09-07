#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Pointer<Ptr>}
     */
    shi1_netname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
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
     * @type {Pointer<Ptr>}
     */
    shi1_remark {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
