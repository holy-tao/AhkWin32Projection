#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EAP_TYPE.ahk

/**
 * Contains type, identification, and author information about an EAP method.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eap_method_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_TYPE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_type">EAP_TYPE</a> structure that contains the ID for the EAP method as well as specific vendor information.
     * @type {EAP_TYPE}
     */
    eapType{
        get {
            if(!this.HasProp("__eapType"))
                this.__eapType := EAP_TYPE(this.ptr + 0)
            return this.__eapType
        }
    }

    /**
     * The numeric ID for the author of the EAP method.
     * @type {Integer}
     */
    dwAuthorId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
