#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * The ADS_SORTKEY structure specifies how to sort a query.
 * @remarks
 * 
  * In Active Directory, if <b>TRUE</b>, the <b>fReverseorder</b> member specifies that the sort results be ordered from the lowest to the highest.
  * 
  * When using the LDAP system provider, the <b>pszReserved</b> member corresponds to the <b>sk_matchruleoid</b> of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure and may be set to a NULL-terminated string that specifies the object identifier (OID) of the matching rule for the sort.  For more information, see <b>LDAPSortKey</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_sortkey
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SORTKEY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the attribute type.
     * @type {PWSTR}
     */
    pszAttrType{
        get {
            if(!this.HasProp("__pszAttrType"))
                this.__pszAttrType := PWSTR(this.ptr + 0)
            return this.__pszAttrType
        }
    }

    /**
     * Reserved.
     * @type {PWSTR}
     */
    pszReserved{
        get {
            if(!this.HasProp("__pszReserved"))
                this.__pszReserved := PWSTR(this.ptr + 8)
            return this.__pszReserved
        }
    }

    /**
     * Reverse the order of the sorted results.
     * @type {BOOLEAN}
     */
    fReverseorder{
        get {
            if(!this.HasProp("__fReverseorder"))
                this.__fReverseorder := BOOLEAN(this.ptr + 16)
            return this.__fReverseorder
        }
    }
}
