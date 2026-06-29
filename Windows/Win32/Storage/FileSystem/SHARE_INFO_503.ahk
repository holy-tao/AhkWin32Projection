#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SHARE_INFO_PERMISSIONS.ahk" { SHARE_INFO_PERMISSIONS }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import ".\SHARE_TYPE.ahk" { SHARE_TYPE }

/**
 * Contains information about the shared resource. It is identical to the SHARE_INFO_502 structure, except that it also contains the server name.
 * @remarks
 * The remote server specified in the <b>shi503_servername</b> member must have been bound to a transport protocol using the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportaddex">NetServerTransportAddEx</a> function. In the call to  <b>NetServerTransportAddEx</b>, either 2 or 3 must have been specified for the <i>level</i> parameter, and the <b>SVTI2_SCOPED_NAME</b> value must have been specified in the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a> structure for the transport protocol.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_503
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_503 {
    #StructPack 8

    /**
     * A pointer to a Unicode string specifying the name of a shared resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi503_netname : PWSTR

    /**
     * A combination of values that specify the type of share. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi503_type : SHARE_TYPE

    /**
     * A pointer to a Unicode string specifying an optional comment about the shared resource.
     */
    shi503_remark : PWSTR

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
     */
    shi503_permissions : SHARE_INFO_PERMISSIONS

    /**
     * Specifies a DWORD value that indicates the maximum number of concurrent connections that the shared resource can accommodate. The number of connections is unlimited if the value specified in this member is –1.
     */
    shi503_max_uses : UInt32

    /**
     * Specifies a DWORD value that indicates the number of current connections to the resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi503_current_uses : UInt32

    /**
     * A pointer to a Unicode string that contains the local path for the shared resource. For disks, this member is the path being shared. For print queues, this member is the name of the print queue being shared. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi503_path : PWSTR

    /**
     * A pointer to a Unicode string that specifies the share's password (when the server is running with share-level security). If the server is running with user-level security, this member is ignored. Note that Windows does not support share-level security. 
     * 
     * 
     * 
     * 
     * This member can be no longer than SHPWLEN+1 bytes (including a terminating null character). Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi503_passwd : PWSTR

    /**
     * A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the shared resource resides. A value of "*" indicates no configured server name.
     */
    shi503_servername : PWSTR

    /**
     * Reserved; must be zero. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi503_reserved : UInt32

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> associated with this share.
     */
    shi503_security_descriptor : PSECURITY_DESCRIPTOR

}
