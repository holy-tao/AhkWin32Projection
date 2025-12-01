#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\PSECURITY_DESCRIPTOR.ahk

/**
 * Contains information about the shared resource, including name of the resource, type and permissions, number of connections, and other pertinent information.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_502
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_502 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the name of a shared resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {PWSTR}
     */
    shi502_netname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A combination of values that specify the type of share. Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     * @type {Integer}
     */
    shi502_type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a Unicode string specifying an optional comment about the shared resource.
     * @type {PWSTR}
     */
    shi502_remark {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    shi502_permissions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies a DWORD value that indicates the maximum number of concurrent connections that the shared resource can accommodate. The number of connections is unlimited if the value specified in this member is –1.
     * @type {Integer}
     */
    shi502_max_uses {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies a DWORD value that indicates the number of current connections to the resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {Integer}
     */
    shi502_current_uses {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to a Unicode string that contains the local path for the shared resource. For disks, this member is the path being shared. For print queues, this member is the name of the print queue being shared. Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     * @type {PWSTR}
     */
    shi502_path {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a Unicode string that specifies the share's password (when the server is running with share-level security). If the server is running with user-level security, this member is ignored. Note that Windows does not support share-level security. 
     * 
     * 
     * 
     * 
     * This member can be no longer than SHPWLEN+1 bytes (including a terminating null character). Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     * @type {PWSTR}
     */
    shi502_passwd {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Reserved; must be zero. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {Integer}
     */
    shi502_reserved {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> associated with this share.
     * @type {PSECURITY_DESCRIPTOR}
     */
    shi502_security_descriptor{
        get {
            if(!this.HasProp("__shi502_security_descriptor"))
                this.__shi502_security_descriptor := PSECURITY_DESCRIPTOR(64, this)
            return this.__shi502_security_descriptor
        }
    }
}
