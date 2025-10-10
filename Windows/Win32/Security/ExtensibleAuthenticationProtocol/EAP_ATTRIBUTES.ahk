#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of EAP attributes.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eap_attributes
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> structures in <b>pAttribs</b>.
     * @type {Integer}
     */
    dwNumberOfAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the address of the first element in an array of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> structures. The total number of elements is specified in <b>dwNumberOfAttributes</b>.
     * @type {Pointer<EAP_ATTRIBUTE>}
     */
    pAttribs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
