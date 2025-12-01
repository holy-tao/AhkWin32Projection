#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used to set and query the role of an LSA server.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-policy_lsa_server_role_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_LSA_SERVER_ROLE_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_lsa_server_role">POLICY_LSA_SERVER_ROLE</a> enumeration type to indicate a primary or backup LSA server.
     * @type {Integer}
     */
    LsaServerRole {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
