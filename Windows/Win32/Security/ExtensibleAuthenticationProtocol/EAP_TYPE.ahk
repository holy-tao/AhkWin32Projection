#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains type and vendor identification information for an EAP method.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_TYPE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The numeric type code for this EAP method.
     * 
     * <div class="alert"><b>Note</b>  For more information on the allocation of EAP method types, see section 6.2 of <a href="http://tools.ietf.org/html/rfc3748">RFC 3748</a>.</div>
     * <div> </div>
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The vendor ID for the EAP method.
     * @type {Integer}
     */
    dwVendorId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The numeric type code for the vendor of this EAP method.
     * @type {Integer}
     */
    dwVendorType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
