#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SHARE_INFO_PERMISSIONS.ahk" { SHARE_INFO_PERMISSIONS }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import ".\SHARE_TYPE.ahk" { SHARE_TYPE }

/**
 * Contains information about the shared resource, including name of the resource, type and permissions, number of connections, and other pertinent information.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_502
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_502 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the name of a shared resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi502_netname : PWSTR

    /**
     * A combination of values that specify the type of share. Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     */
    shi502_type : SHARE_TYPE

    /**
     * Pointer to a Unicode string specifying an optional comment about the shared resource.
     */
    shi502_remark : PWSTR

    shi502_permissions : SHARE_INFO_PERMISSIONS

    /**
     * Specifies a DWORD value that indicates the maximum number of concurrent connections that the shared resource can accommodate. The number of connections is unlimited if the value specified in this member is –1.
     */
    shi502_max_uses : UInt32

    /**
     * Specifies a DWORD value that indicates the number of current connections to the resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi502_current_uses : UInt32

    /**
     * Pointer to a Unicode string that contains the local path for the shared resource. For disks, this member is the path being shared. For print queues, this member is the name of the print queue being shared. Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     */
    shi502_path : PWSTR

    /**
     * Pointer to a Unicode string that specifies the share's password (when the server is running with share-level security). If the server is running with user-level security, this member is ignored. Note that Windows does not support share-level security. 
     * 
     * 
     * 
     * 
     * This member can be no longer than SHPWLEN+1 bytes (including a terminating null character). Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     */
    shi502_passwd : PWSTR

    /**
     * Reserved; must be zero. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi502_reserved : UInt32

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> associated with this share.
     */
    shi502_security_descriptor : PSECURITY_DESCRIPTOR

}
