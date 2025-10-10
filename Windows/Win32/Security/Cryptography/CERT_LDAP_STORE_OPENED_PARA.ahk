#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the CertOpenStore function when the CERT_STORE_PROV_LDAP provider is specified by using the CERT_LDAP_STORE_OPENED_FLAG flag to specify both the existing LDAP session to use to perform the query as well as the LDAP query string.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_ldap_store_opened_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_LDAP_STORE_OPENED_PARA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The handle of the existing LDAP session. This is the handle that is returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> function.
     * @type {Pointer<Void>}
     */
    pvLdapSessionHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The address of a null-terminated Unicode string that contains the LDAP query string. For more information about LDAP query strings, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-dialect">LDAP Dialect</a>.
     * @type {Pointer<Char>}
     */
    pwszLdapUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
