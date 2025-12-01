#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\PSECURITY_DESCRIPTOR.ahk

/**
 * Contains information about the shared resource. It is identical to the SHARE_INFO_502 structure, except that it also contains the server name.
 * @remarks
 * The remote server specified in the <b>shi503_servername</b> member must have been bound to a transport protocol using the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportaddex">NetServerTransportAddEx</a> function. In the call to  <b>NetServerTransportAddEx</b>, either 2 or 3 must have been specified for the <i>level</i> parameter, and the <b>SVTI2_SCOPED_NAME</b> value must have been specified in the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a> structure for the transport protocol.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_503
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_503 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A pointer to a Unicode string specifying the name of a shared resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {PWSTR}
     */
    shi503_netname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A combination of values that specify the type of share. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {Integer}
     */
    shi503_type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a Unicode string specifying an optional comment about the shared resource.
     * @type {PWSTR}
     */
    shi503_remark {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies a DWORD value that indicates the shared resource's permissions for servers running with share-level security. Note that Windows does not support share-level security. This member is ignored on a server running user-level security. For more information about controlling access to securable objects, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>, <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a>, and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">Securable Objects</a>. 
     * 
     * 
     * 
     * 
     * 
     * 
     * Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {Integer}
     */
    shi503_permissions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies a DWORD value that indicates the maximum number of concurrent connections that the shared resource can accommodate. The number of connections is unlimited if the value specified in this member is –1.
     * @type {Integer}
     */
    shi503_max_uses {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies a DWORD value that indicates the number of current connections to the resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {Integer}
     */
    shi503_current_uses {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a Unicode string that contains the local path for the shared resource. For disks, this member is the path being shared. For print queues, this member is the name of the print queue being shared. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {PWSTR}
     */
    shi503_path {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a Unicode string that specifies the share's password (when the server is running with share-level security). If the server is running with user-level security, this member is ignored. Note that Windows does not support share-level security. 
     * 
     * 
     * 
     * 
     * This member can be no longer than SHPWLEN+1 bytes (including a terminating null character). Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {PWSTR}
     */
    shi503_passwd {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the shared resource resides. A value of "*" indicates no configured server name.
     * @type {PWSTR}
     */
    shi503_servername {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Reserved; must be zero. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     * @type {Integer}
     */
    shi503_reserved {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> associated with this share.
     * @type {PSECURITY_DESCRIPTOR}
     */
    shi503_security_descriptor{
        get {
            if(!this.HasProp("__shi503_security_descriptor"))
                this.__shi503_security_descriptor := PSECURITY_DESCRIPTOR(72, this)
            return this.__shi503_security_descriptor
        }
    }
}
