#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to set up the search parameters for a virtual list view (VLV) request control (LDAP_CONTROL_VLVREQUEST).
 * @remarks
 * 
  * There are two methods for calculating the target of a VLV search: using an attribute value or using an offset. Different elements of this structure will be used depending on which type of search you choose. Both methods require that values be entered for the <b>ldvlv_before_count</b> and <b>ldvlv_after_count</b> members. Specify a list content count in <b>ldvlv_count</b>, or if you do not know this value, then use zero (0), so that the server will calculate it.
  * 
  * <ul>
  * <li>
  * Searching with Attribute Values
  * 
  * To perform a value-based search, for example, if you wanted to search for Jeff Smith, and you know the attribute type for that value, then set the attribute type in the <b>sk_attrtype</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure and the attribute value in <b>ldvlv_attrvalue</b>. The <b>ldvlv_offset</b> member is ignored for this type of search, so it is not necessary to set it.
  * 
  * For example, to perform a search using the letter J. To retrieve 20 results, set <b>ldvlv_before_count</b> to 9, <b>ldvlv_after_count</b> to 10 and <b>ldvlv_attrvalue</b> to J. The server finds the first entry in the list that is not less than J, such as Jeff Smith, and returns the nine preceding entries, the target entry, and the proceeding 10 entries. The server would return a <b>ldvlv_count</b> of 30000 and a <b>ldvlv_offset</b> of 4053 in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a> control; that is assuming that Jeff Smith is entry number 4053 on the list. The server may return few entries than requested before and/or after the target entry if there are insufficient entries in the list to satisfy the request. For example, if there were only two entries total before the first 'J' entry, the server could not return nine preceding entries.
  * 
  * </li>
  * <li>
  * Searching with Offsets
  * 
  * To use offsets for your search, set an offset in <b>ldvlv_offset</b>, and set <b>ldvlv_attrvalue</b> to <b>NULL</b>. Also set the attribute type in the <b>sk_attrtype</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a>, but this time, the target will be an offset within the list of entries for that attribute type, rather than a specific attribute value.
  * 
  * For example, to target the search 68 percent of the search results list. If the <b>ldvlv_count</b> is 30000, the 68 percent of 30000 is 20400. To retrieve 20 results, set <b>ldvlv_before_count</b> to 9, <b>ldvlv_after_count</b> to 10, <b>ldvlv_count</b> to 30000, <b>ldvlv_offset</b> to 20400 and send the request to the server. The server  returns the preceding 20 entries in the list, plus the <b>ldvlv_count</b> of 30000 and a <b>ldvlv_offset</b> of 20400. Be aware that it is possible for the number of entries on the list to change between the client estimation of the number of entries and the server processing the search, which in turn effects the offsets. In this case the target entry returned may not be exactly the target entry the client was expecting. Applications must be prepared to handle this uncertainty.
  * 
  * </li>
  * </ul>
  * Be aware that a sort control must accompany a VLV search request to specify the ordered list of entries against which the VLV search is performed. Servers can reject VLV searches performed against lists for which they do not have indexes.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winldap/ns-winldap-ldapvlvinfo
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class LDAPVLVInfo extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Identifies the version of the <b>LDAPVLVInfo</b> structure. This should always be set to the value LDAP_VLVINFO_VERSION (1).
     * @type {Integer}
     */
    ldvlv_version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Identifies the number of entries before the target entry that the client wants the server to send back in the list results. This field corresponds to the <b>beforeCount</b> element of the BER-encoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a> control.
     * @type {Integer}
     */
    ldvlv_before_count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates the number of entries after the target entry the client instructs the server to send back in the list results. This field corresponds to the <b>afterCount</b> element of the BER-encoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a> control.
     * @type {Integer}
     */
    ldvlv_after_count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Indicates a ratio between the offset value and the content count. For example, consider if  a user drags the scroll bar to view entries in the middle of the list. If the client estimates that the entire list contains 100 entries, then  to view the middle list it will calculate the offset to be 50, so the client sends this offset value, with 100 as the content count, sent in the <b>ldvlv_count</b> member, to the server. When the server receives this data, it may actually have calculated the content count to be 500, so it calculates the offset to find the target that the client requested, using the following formula:
     * 
     * Si = Sc * (Ci / Cc)
     * 
     * where
     * 
     * Si is the actual list offset used by the server
     * 
     * Sc is the server estimate for content count
     * 
     * Ci is the client-submitted offset
     * 
     * Cc is the client-submitted content count
     * 
     * If the client uses an offset value of one (1), it indicates that the target is the first entry in the list. If the client uses an offset value that equals <b>ldvlv_count</b>, then the item is the last entry in the list. The offset will equal zero (0) when <b>ldvlv_count</b> equals zero, which would be the last entry in the list.
     * 
     * Offsets are used only if the search is not based on an attribute value, so <b>ldvlv_attrvalue</b> must be <b>NULL</b>. This field corresponds to the offset element within the BER-encoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a> control.
     * @type {Integer}
     */
    ldvlv_offset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Indicates the content count of the list. An estimation of the content count is sent by the client to the server when sending a search request, in order to enable the server to calculate an offset value. The server returns its own calculation of the content count to the client in its response. If the client does not have an estimate for content count, it sends zero (0), which indicates that the server should use its own estimate for content count. This member is used with <b>ldvlv_offset</b>. Because content count is required only if the search is not based on an attribute value, the <b>ldvlv_attrvalue</b> member must be <b>NULL</b>. This field corresponds to the <b>contentCount</b> element within the BER-encoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a> control and the <b>contentCount</b> element within the BER-encoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a> control.
     * @type {Integer}
     */
    ldvlv_count {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Provides an attribute value as a target entry for the search. The server compares this member to values that have the same attribute type, as specified in the <b>sk_attrtype</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure. If an offset is used, then this member must be <b>NULL</b>. This member corresponds to the <b>assertionValue</b> element of the BER-encoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a> control.
     * @type {Pointer<LDAP_BERVAL>}
     */
    ldvlv_attrvalue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Provides the context ID that is assigned by the server to identify this search operation. This is an opaque "cookie" used by the server to keep internal track of the current VLV operation. On the first call to the search operation using the VLV control, this parameter should be set to <b>NULL</b>. The server may return a value in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a> message. This "cookie" value should be returned to the server on the next call to a search function that is performed against a particular VLV list.
     * @type {Pointer<LDAP_BERVAL>}
     */
    ldvlv_context {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * This field is reserved for application-specific use and is not used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_vlv_controla">ldap_create_vlv_control</a> function; it has no effect on the control that is created.
     * @type {Pointer<Void>}
     */
    ldvlv_extradata {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
