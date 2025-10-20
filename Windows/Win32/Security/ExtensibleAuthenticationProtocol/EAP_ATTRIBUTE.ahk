#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an EAP attribute.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eap_attribute
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_ATTRIBUTE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_attribute_type">EAP_ATTRIBUTE_TYPE</a> enumeration value that describes the type of the EAP attribute value supplied in <b>pValue</b>.
     * @type {Integer}
     */
    eaType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size, in bytes, of <b>pValue</b>.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a byte buffer that contains the data value of the attribute.
     * @type {Pointer<Integer>}
     */
    pValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
