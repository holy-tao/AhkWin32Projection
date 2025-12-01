#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the data needed to request a token. It is used as the input parameter of the CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN control code.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_netname_vs_token_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_NETNAME_VS_TOKEN_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Process ID of the process requesting the token.
     * @type {Integer}
     */
    ProcessID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies an access mask that specifies the requested types of access. For a list of access rights for access 
     *       tokens, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
     * @type {Integer}
     */
    DesiredAccess {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates whether the new handle is inheritable. If <b>TRUE</b>, the duplicate handle can 
     *       be inherited by new processes created by the target process. If <b>FALSE</b>, the new handle 
     *       cannot be inherited.
     * @type {BOOL}
     */
    InheritHandle {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
