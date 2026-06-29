#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SHARE_TYPE.ahk" { SHARE_TYPE }

/**
 * Contains information about the shared resource, including the name and type of the resource, and a comment associated with the resource.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_1 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the share name of a resource. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> function ignore this member.
     */
    shi1_netname : PWSTR

    /**
     * A combination of values that specify the type of the shared resource. Calls to the 
     * <b>NetShareSetInfo</b> function ignore this member.
     */
    shi1_type : SHARE_TYPE

    /**
     * Pointer to a Unicode string specifying an optional comment about the shared resource.
     */
    shi1_remark : PWSTR

}
