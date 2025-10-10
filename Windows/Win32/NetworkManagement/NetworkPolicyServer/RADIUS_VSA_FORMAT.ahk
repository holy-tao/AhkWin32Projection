#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RADIUS_VSA_FORMAT structure represents the format of the string portion of a RADIUS vendor-specific attribute.
 * @remarks
 * 
  * The 
  * <b>RADIUS_VSA_FORMAT</b> structure is useful for interpreting the <b>lpValue</b> member of a 
  * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> structure when the <b>dwAttrType</b> member has a value <b>ratVendorSpecific</b>.
  * 
  * See 
  * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for a description of RADIUS vendor-specific attributes. See 
  * <a href="https://www.ietf.org/rfc/rfc2548.txt">RFC 2548</a> for examples of RADIUS vendor-specific attributes used by Microsoft.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//authif/ns-authif-radius_vsa_format
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_VSA_FORMAT extends Win32Struct
{
    static sizeof => 7

    static packingSize => 1

    /**
     * The SMI Network Management Private Enterprise Code of the vendor for this attribute.
     * @type {Array<Byte>}
     */
    VendorId{
        get {
            if(!this.HasProp("__VendorIdProxyArray"))
                this.__VendorIdProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__VendorIdProxyArray
        }
    }

    /**
     * Numeric identifier for the attribute assigned by the vendor.
     * @type {Integer}
     */
    VendorType {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * The combined size of the <b>VendorType</b>, <b>VendorLength</b>, <b>AttributeSpecific</b> members.
     * @type {Integer}
     */
    VendorLength {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Array of bytes that contains information for this attribute.
     * @type {Array<Byte>}
     */
    AttributeSpecific{
        get {
            if(!this.HasProp("__AttributeSpecificProxyArray"))
                this.__AttributeSpecificProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__AttributeSpecificProxyArray
        }
    }
}
