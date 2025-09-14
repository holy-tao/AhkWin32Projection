#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_SORTKEY structure specifies how to sort a query.
 * @remarks
 * In Active Directory, if <b>TRUE</b>, the <b>fReverseorder</b> member specifies that the sort results be ordered from the lowest to the highest.
  * 
  * When using the LDAP system provider, the <b>pszReserved</b> member corresponds to the <b>sk_matchruleoid</b> of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure and may be set to a NULL-terminated string that specifies the object identifier (OID) of the matching rule for the sort.  For more information, see <b>LDAPSortKey</b>.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_sortkey
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SORTKEY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the attribute type.
     * @type {Pointer<PWSTR>}
     */
    pszAttrType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Pointer<PWSTR>}
     */
    pszReserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reverse the order of the sorted results.
     * @type {Integer}
     */
    fReverseorder {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
