#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves data about the API and implementations used. (ANSI)
 * @remarks
 * A pointer to this structure is passed with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">LDAP_OPT_API_INFO</a> session option, to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_option</a>, to retrieve data about this LDAP API library.  The data returned includes a list of any API extensions supported by the implementation. When the structure data is no longer required, the caller must free the individual strings and string arrays returned in this structure by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a> functions.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winldap.h header defines LDAPAPIInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapapiinfoa
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 * @charset ANSI
 */
class LDAPAPIInfoA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The version of this structure, which must be set to <b>LDAP_API_INFO_VERSION</b> before a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_option</a>.
     * @type {Integer}
     */
    ldapai_info_version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The current revision number of this LDAP API library.
     * @type {Integer}
     */
    ldapai_api_version {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The latest LDAP version supported by this LDAP API library.
     * @type {Integer}
     */
    ldapai_protocol_version {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Pointer to an array of null-terminated strings that indicate what API extensions are supported.
     * @type {Pointer<SByte>}
     */
    ldapai_extensions {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the API vendor.  This implementation returns the string ""Microsoft Corporation."".
     * @type {Pointer<PSTR>}
     */
    ldapai_vendor_name {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The API vendor version number. This implementation returns an integer value in the format of MMnn, where MM is the major version number * 100, and nn is the minor version number.  For example, version 5.10 is returned as 510.
     * @type {Integer}
     */
    ldapai_vendor_version {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
