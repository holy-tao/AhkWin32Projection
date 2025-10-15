#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * The LDAPSortKey structure stores sorting criteria for use by sort controls.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winldap/ns-winldap-ldapsortkeya
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 * @charset ANSI
 */
class LDAPSortKeyA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of the attribute to use as a sort key. Use multiple <b>LDAPSortKey</b> structures to specify multiple sort keys. Be aware that Active Directory supports only a single sort key.
     * @type {PSTR}
     */
    sk_attrtype{
        get {
            if(!this.HasProp("__sk_attrtype"))
                this.__sk_attrtype := PSTR(this.ptr + 0)
            return this.__sk_attrtype
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the object identifier of the matching rule for the sort. Should be set to <b>NULL</b> if you do not want to explicitly specify a matching rule for the sort. Specifying an explicitly set matching rule is supported only by Windows Server 2003.
     * @type {PSTR}
     */
    sk_matchruleoid{
        get {
            if(!this.HasProp("__sk_matchruleoid"))
                this.__sk_matchruleoid := PSTR(this.ptr + 8)
            return this.__sk_matchruleoid
        }
    }

    /**
     * If <b>TRUE</b>, specifies that the sort be ordered from lowest to highest. If <b>FALSE</b>, the sort order is from highest to lowest.
     * @type {BOOLEAN}
     */
    sk_reverseorder{
        get {
            if(!this.HasProp("__sk_reverseorder"))
                this.__sk_reverseorder := BOOLEAN(this.ptr + 16)
            return this.__sk_reverseorder
        }
    }
}
