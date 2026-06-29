#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RADIUS_VSA_FORMAT structure represents the format of the string portion of a RADIUS vendor-specific attribute.
 * @remarks
 * The 
 * <b>RADIUS_VSA_FORMAT</b> structure is useful for interpreting the <b>lpValue</b> member of a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> structure when the <b>dwAttrType</b> member has a value <b>ratVendorSpecific</b>.
 * 
 * See 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for a description of RADIUS vendor-specific attributes. See 
 * <a href="https://www.ietf.org/rfc/rfc2548.txt">RFC 2548</a> for examples of RADIUS vendor-specific attributes used by Microsoft.
 * @see https://learn.microsoft.com/windows/win32/api/authif/ns-authif-radius_vsa_format
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct RADIUS_VSA_FORMAT {
    #StructPack 1

    /**
     * The SMI Network Management Private Enterprise Code of the vendor for this attribute.
     */
    VendorId : Int8[4]

    /**
     * Numeric identifier for the attribute assigned by the vendor.
     */
    VendorType : Int8

    /**
     * The combined size of the <b>VendorType</b>, <b>VendorLength</b>, <b>AttributeSpecific</b> members.
     */
    VendorLength : Int8

    /**
     * Array of bytes that contains information for this attribute.
     */
    AttributeSpecific : Int8[1]

}
