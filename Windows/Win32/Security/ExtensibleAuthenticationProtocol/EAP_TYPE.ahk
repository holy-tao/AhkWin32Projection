#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains type and vendor identification information for an EAP method.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_TYPE {
    #StructPack 4

    /**
     * The numeric type code for this EAP method.
     * 
     * <div class="alert"><b>Note</b>  For more information on the allocation of EAP method types, see section 6.2 of <a href="http://tools.ietf.org/html/rfc3748">RFC 3748</a>.</div>
     * <div> </div>
     */
    type : Int8

    /**
     * The vendor ID for the EAP method.
     */
    dwVendorId : UInt32

    /**
     * The numeric type code for the vendor of this EAP method.
     */
    dwVendorType : UInt32

}
