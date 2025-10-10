#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains a single attribute of a relative distinguished name (RDN). A whole RDN is expressed in a CERT_RDN structure that contains an array of CERT_RDN_ATTR structures.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_rdn_attr
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_RDN_ATTR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">Object identifier</a> (OID) for the type of the attribute defined in this structure. This member can be one of the following OIDs.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_AUTHORITY_REVOCATION_LIST"></a><a id="szoid_authority_revocation_list"></a><a id="SZOID_AUTHORITY_REVOCATION_LIST"></a><dl>
     * <dt><b>szOID_AUTHORITY_REVOCATION_LIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_BUSINESS_CATEGORY"></a><a id="szoid_business_category"></a><a id="SZOID_BUSINESS_CATEGORY"></a><dl>
     * <dt><b>szOID_BUSINESS_CATEGORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Explanatory attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_CA_CERTIFICATE"></a><a id="szoid_ca_certificate"></a><a id="SZOID_CA_CERTIFICATE"></a><dl>
     * <dt><b>szOID_CA_CERTIFICATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_CERTIFICATE_REVOCATION_LIST"></a><a id="szoid_certificate_revocation_list"></a><a id="SZOID_CERTIFICATE_REVOCATION_LIST"></a><dl>
     * <dt><b>szOID_CERTIFICATE_REVOCATION_LIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_COMMON_NAME"></a><a id="szoid_common_name"></a><a id="SZOID_COMMON_NAME"></a><dl>
     * <dt><b>szOID_COMMON_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Labeling attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_COUNTRY_NAME"></a><a id="szoid_country_name"></a><a id="SZOID_COUNTRY_NAME"></a><dl>
     * <dt><b>szOID_COUNTRY_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Two-character printable string.
     * Geographic attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_CROSS_CERTIFICATE_PAIR"></a><a id="szoid_cross_certificate_pair"></a><a id="SZOID_CROSS_CERTIFICATE_PAIR"></a><dl>
     * <dt><b>szOID_CROSS_CERTIFICATE_PAIR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_DESCRIPTION"></a><a id="szoid_description"></a><a id="SZOID_DESCRIPTION"></a><dl>
     * <dt><b>szOID_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string. Explanatory attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_DESTINATION_INDICATOR"></a><a id="szoid_destination_indicator"></a><a id="SZOID_DESTINATION_INDICATOR"></a><dl>
     * <dt><b>szOID_DESTINATION_INDICATOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Printable string.
     * Telecommunications addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_DEVICE_SERIAL_NUMBER"></a><a id="szoid_device_serial_number"></a><a id="SZOID_DEVICE_SERIAL_NUMBER"></a><dl>
     * <dt><b>szOID_DEVICE_SERIAL_NUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Printable string.
     * Labeling attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_DOMAIN_COMPONENT"></a><a id="szoid_domain_component"></a><a id="SZOID_DOMAIN_COMPONENT"></a><dl>
     * <dt><b>szOID_DOMAIN_COMPONENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IA5 string. DNS name component such as "com."
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_FACSIMILE_TELEPHONE_NUMBER"></a><a id="szoid_facsimile_telephone_number"></a><a id="SZOID_FACSIMILE_TELEPHONE_NUMBER"></a><dl>
     * <dt><b>szOID_FACSIMILE_TELEPHONE_NUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Telecommunications addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_GIVEN_NAME"></a><a id="szoid_given_name"></a><a id="SZOID_GIVEN_NAME"></a><dl>
     * <dt><b>szOID_GIVEN_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Name attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_INITIALS"></a><a id="szoid_initials"></a><a id="SZOID_INITIALS"></a><dl>
     * <dt><b>szOID_INITIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string. Name attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_INTERNATIONAL_ISDN_NUMBER"></a><a id="szoid_international_isdn_number"></a><a id="SZOID_INTERNATIONAL_ISDN_NUMBER"></a><dl>
     * <dt><b>szOID_INTERNATIONAL_ISDN_NUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Numeric string.
     * Telecommunications addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_LOCALITY_NAME"></a><a id="szoid_locality_name"></a><a id="SZOID_LOCALITY_NAME"></a><dl>
     * <dt><b>szOID_LOCALITY_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Geographic attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_MEMBER"></a><a id="szoid_member"></a><a id="SZOID_MEMBER"></a><dl>
     * <dt><b>szOID_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Relational application attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_ORGANIZATION_NAME"></a><a id="szoid_organization_name"></a><a id="SZOID_ORGANIZATION_NAME"></a><dl>
     * <dt><b>szOID_ORGANIZATION_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Organizational attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_ORGANIZATIONAL_UNIT_NAME"></a><a id="szoid_organizational_unit_name"></a><a id="SZOID_ORGANIZATIONAL_UNIT_NAME"></a><dl>
     * <dt><b>szOID_ORGANIZATIONAL_UNIT_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Organizational attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_OWNER"></a><a id="szoid_owner"></a><a id="SZOID_OWNER"></a><dl>
     * <dt><b>szOID_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Relational application attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_PHYSICAL_DELIVERY_OFFICE_NAME"></a><a id="szoid_physical_delivery_office_name"></a><a id="SZOID_PHYSICAL_DELIVERY_OFFICE_NAME"></a><dl>
     * <dt><b>szOID_PHYSICAL_DELIVERY_OFFICE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Postal addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_PKCS_12_FRIENDLY_NAME_ATTR"></a><a id="szoid_pkcs_12_friendly_name_attr"></a><a id="SZOID_PKCS_12_FRIENDLY_NAME_ATTR"></a><dl>
     * <dt><b>szOID_PKCS_12_FRIENDLY_NAME_ATTR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PKCS #12 attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_PKCS_12_LOCAL_KEY_ID"></a><a id="szoid_pkcs_12_local_key_id"></a><a id="SZOID_PKCS_12_LOCAL_KEY_ID"></a><dl>
     * <dt><b>szOID_PKCS_12_LOCAL_KEY_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PKCS #12 attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_POST_OFFICE_BOX"></a><a id="szoid_post_office_box"></a><a id="SZOID_POST_OFFICE_BOX"></a><dl>
     * <dt><b>szOID_POST_OFFICE_BOX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Postal addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_POSTAL_ADDRESS"></a><a id="szoid_postal_address"></a><a id="SZOID_POSTAL_ADDRESS"></a><dl>
     * <dt><b>szOID_POSTAL_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Printable string.
     * Postal addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_POSTAL_CODE"></a><a id="szoid_postal_code"></a><a id="SZOID_POSTAL_CODE"></a><dl>
     * <dt><b>szOID_POSTAL_CODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Postal addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_PREFERRED_DELIVERY_METHOD"></a><a id="szoid_preferred_delivery_method"></a><a id="SZOID_PREFERRED_DELIVERY_METHOD"></a><dl>
     * <dt><b>szOID_PREFERRED_DELIVERY_METHOD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Preference attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_PRESENTATION_ADDRESS"></a><a id="szoid_presentation_address"></a><a id="SZOID_PRESENTATION_ADDRESS"></a><dl>
     * <dt><b>szOID_PRESENTATION_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * OSI application attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_REGISTERED_ADDRESS"></a><a id="szoid_registered_address"></a><a id="SZOID_REGISTERED_ADDRESS"></a><dl>
     * <dt><b>szOID_REGISTERED_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Telecommunications addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_ROLE_OCCUPANT"></a><a id="szoid_role_occupant"></a><a id="SZOID_ROLE_OCCUPANT"></a><dl>
     * <dt><b>szOID_ROLE_OCCUPANT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Relational application attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_RSA_emailAddr"></a><a id="szoid_rsa_emailaddr"></a><a id="SZOID_RSA_EMAILADDR"></a><dl>
     * <dt><b>szOID_RSA_emailAddr</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IA5 string.
     * Email attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_SEARCH_GUIDE"></a><a id="szoid_search_guide"></a><a id="SZOID_SEARCH_GUIDE"></a><dl>
     * <dt><b>szOID_SEARCH_GUIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Explanatory attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_SEE_ALSO"></a><a id="szoid_see_also"></a><a id="SZOID_SEE_ALSO"></a><dl>
     * <dt><b>szOID_SEE_ALSO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Relational application attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_STATE_OR_PROVINCE_NAME"></a><a id="szoid_state_or_province_name"></a><a id="SZOID_STATE_OR_PROVINCE_NAME"></a><dl>
     * <dt><b>szOID_STATE_OR_PROVINCE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Geographic attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_STREET_ADDRESS"></a><a id="szoid_street_address"></a><a id="SZOID_STREET_ADDRESS"></a><dl>
     * <dt><b>szOID_STREET_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Geographic attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_SUPPORTED_APPLICATION_CONTEXT"></a><a id="szoid_supported_application_context"></a><a id="SZOID_SUPPORTED_APPLICATION_CONTEXT"></a><dl>
     * <dt><b>szOID_SUPPORTED_APPLICATION_CONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * OSI application attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_SUR_NAME"></a><a id="szoid_sur_name"></a><a id="SZOID_SUR_NAME"></a><dl>
     * <dt><b>szOID_SUR_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Labeling attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_TELEPHONE_NUMBER"></a><a id="szoid_telephone_number"></a><a id="SZOID_TELEPHONE_NUMBER"></a><dl>
     * <dt><b>szOID_TELEPHONE_NUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Telecommunications addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_TELETEXT_TERMINAL_IDENTIFIER"></a><a id="szoid_teletext_terminal_identifier"></a><a id="SZOID_TELETEXT_TERMINAL_IDENTIFIER"></a><dl>
     * <dt><b>szOID_TELETEXT_TERMINAL_IDENTIFIER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Telecommunications addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_TELEX_NUMBER"></a><a id="szoid_telex_number"></a><a id="SZOID_TELEX_NUMBER"></a><dl>
     * <dt><b>szOID_TELEX_NUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Telecommunications addressing attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_TITLE"></a><a id="szoid_title"></a><a id="SZOID_TITLE"></a><dl>
     * <dt><b>szOID_TITLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Case-insensitive string.
     * Organizational attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_USER_CERTIFICATE"></a><a id="szoid_user_certificate"></a><a id="SZOID_USER_CERTIFICATE"></a><dl>
     * <dt><b>szOID_USER_CERTIFICATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_USER_PASSWORD"></a><a id="szoid_user_password"></a><a id="SZOID_USER_PASSWORD"></a><dl>
     * <dt><b>szOID_USER_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_X21_ADDRESS"></a><a id="szoid_x21_address"></a><a id="SZOID_X21_ADDRESS"></a><dl>
     * <dt><b>szOID_X21_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Numeric string.
     * Telecommunications addressing attribute.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Byte>}
     */
    pszObjId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicates the interpretation of the <b>Value</b> member.
     * @type {Integer}
     */
    dwValueType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_RDN_VALUE_BLOB</a> that contains the attribute value. The <b>cbData</b> member of <b>Value</b> is the length, in bytes, of the <b>pbData</b> member. It is not the number of elements in the <b>pbData</b> string. 
     * 
     * 
     * 
     * 
     * For example, a <b>DWORD</b> is 32 bits or 4 bytes long. If <b>pbData</b> is a <b>DWORD</b> array, <b>cbData</b> would be four times the number of <b>DWORD</b> elements in the array. A <b>SHORT</b> is 16 bits or 2 bytes long. If <b>pbData</b> is an array of <b>SHORT</b> elements, <b>cbData</b> must be two times the length of the array.
     * 
     * The <b>pbData</b> member of <b>Value</b> can be a null-terminated array of 8-bit or 16-bit characters or a fixed-length array of elements. If <b>dwValueType</b> is set to CERT_RDN_ENCODED_BLOB, <b>pbData</b> is encoded.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__Value
        }
    }
}
