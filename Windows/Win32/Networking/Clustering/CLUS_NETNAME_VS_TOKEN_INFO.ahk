#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the data needed to request a token. It is used as the input parameter of the CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN control code.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_netname_vs_token_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_NETNAME_VS_TOKEN_INFO {
    #StructPack 4

    /**
     * Process ID of the process requesting the token.
     */
    ProcessID : UInt32

    /**
     * Specifies an access mask that specifies the requested types of access. For a list of access rights for access 
     *       tokens, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
     */
    DesiredAccess : UInt32

    /**
     * Indicates whether the new handle is inheritable. If <b>TRUE</b>, the duplicate handle can 
     *       be inherited by new processes created by the target process. If <b>FALSE</b>, the new handle 
     *       cannot be inherited.
     */
    InheritHandle : BOOL

}
