#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * The ADS_SORTKEY structure specifies how to sort a query.
 * @remarks
 * In Active Directory, if <b>TRUE</b>, the <b>fReverseorder</b> member specifies that the sort results be ordered from the lowest to the highest.
 * 
 * When using the LDAP system provider, the <b>pszReserved</b> member corresponds to the <b>sk_matchruleoid</b> of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure and may be set to a NULL-terminated string that specifies the object identifier (OID) of the matching rule for the sort.  For more information, see <b>LDAPSortKey</b>.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_sortkey
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_SORTKEY {
    #StructPack 8

    /**
     * The null-terminated Unicode string that contains the attribute type.
     */
    pszAttrType : PWSTR

    /**
     * Reserved.
     */
    pszReserved : PWSTR

    /**
     * Reverse the order of the sorted results.
     */
    fReverseorder : BOOLEAN

}
