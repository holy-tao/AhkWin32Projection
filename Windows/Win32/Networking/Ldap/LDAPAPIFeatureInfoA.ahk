#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Retrieves data about any supported LDAP API extensions. (ANSI)
 * @remarks
 * A pointer to this structure is passed, along with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">LDAP_FEATURE_API_INFO</a> session option and the name of the desired API extension, to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_option</a>, to retrieve detailed data about the LDAP API extension.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winldap.h header defines LDAPAPIFeatureInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapapifeatureinfoa
 * @namespace Windows.Win32.Networking.Ldap
 * @charset ANSI
 */
export default struct LDAPAPIFeatureInfoA {
    #StructPack 8

    /**
     * The version of this structure, which must be set to <b>LDAP_FEATURE_INFO_VERSION</b> before the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_option</a> is performed.
     */
    ldapaif_info_version : Int32

    /**
     * A pointer to a null-terminated string that contains the name of the desired API extension.  This value is set before the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_option</a> is performed, and should match one of the strings returned in the <b>ldapai_extensions</b> member of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapapiinfoa">LDAPAPIInfo</a> set  from a previous call to <b>ldap_get_option</b>.
     */
    ldapaif_name : PSTR

    /**
     * The vendor API extension version number.  This implementation returns an integer value in the format of MMnnn, where MM is the major version number * 1000, and nnn is the minor version number.  For example, version 1.001 would be returned as the number 1001.
     */
    ldapaif_version : Int32

}
