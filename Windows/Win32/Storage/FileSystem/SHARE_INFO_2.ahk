#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the shared resource, including name of the resource, type and permissions, and the number of current connections.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_2
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_2 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the share name of a resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {Pointer<PWSTR>}
     */
    shi2_netname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A combination of values that specify the type of the shared resource. Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     * @type {Integer}
     */
    shi2_type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a Unicode string that contains an optional comment about the shared resource.
     * @type {Pointer<PWSTR>}
     */
    shi2_remark {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    shi2_permissions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies a DWORD value that indicates the maximum number of concurrent connections that the shared resource can accommodate. The number of connections is unlimited if the value specified in this member is –1.
     * @type {Integer}
     */
    shi2_max_uses {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies a DWORD value that indicates the number of current connections to the resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {Integer}
     */
    shi2_current_uses {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to a Unicode string specifying the local path for the shared resource. For disks, <b>shi2_path</b> is the path being shared. For print queues, <b>shi2_path</b> is the name of the print queue being shared. Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     * @type {Pointer<PWSTR>}
     */
    shi2_path {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a Unicode string that specifies the share's password when the server is running with share-level security. If the server is running with user-level security, this member is ignored. The <b>shi2_passwd</b> member can be no longer than SHPWLEN+1 bytes (including a terminating null character). Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member. Note that Windows does not support share-level security.
     * @type {Pointer<PWSTR>}
     */
    shi2_passwd {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
