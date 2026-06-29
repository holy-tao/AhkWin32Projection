#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * The LDAPSortKey structure stores sorting criteria for use by sort controls. (Unicode)
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_sort_control">ldap_create_sort_control</a> and 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_init_page">ldap_search_init_page</a> functions use this structure to specify how results should be sorted before being returned to the client.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winldap.h header defines LDAPSortKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapsortkeyw
 * @namespace Windows.Win32.Networking.Ldap
 * @charset Unicode
 */
export default struct LDAPSortKeyW {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of the attribute to use as a sort key. Use multiple <b>LDAPSortKey</b> structures to specify multiple sort keys. Be aware that Active Directory supports only a single sort key.
     */
    sk_attrtype : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the object identifier of the matching rule for the sort. Should be set to <b>NULL</b> if you do not want to explicitly specify a matching rule for the sort. Specifying an explicitly set matching rule is supported only by Windows Server 2003.
     */
    sk_matchruleoid : PWSTR

    /**
     * If <b>TRUE</b>, specifies that the sort be ordered from lowest to highest. If <b>FALSE</b>, the sort order is from highest to lowest.
     */
    sk_reverseorder : BOOLEAN

}
