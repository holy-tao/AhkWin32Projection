#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EAP_TYPE.ahk
#Include .\EAP_METHOD_TYPE.ahk

/**
 * Contains information about an EAP method. (EAP_METHOD_INFO_EX)
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_info_ex
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_INFO_EX extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that identifies the EAP method.
     * @type {EAP_METHOD_TYPE}
     */
    eaptype{
        get {
            if(!this.HasProp("__eaptype"))
                this.__eaptype := EAP_METHOD_TYPE(0, this)
            return this.__eaptype
        }
    }

    /**
     * Pointer to a zero-terminated Unicode string that contains the name of the EAP method's author.
     * @type {PWSTR}
     */
    pwszAuthorName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a zero-terminated Unicode string that contains the display name of the EAP method.
     * @type {PWSTR}
     */
    pwszFriendlyName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Set of flags that describe specific properties of the EAP methods. For flag descriptions, see [EAP Method Properties](/windows/win32/eaphost/eap-method-properties).
     * @type {Integer}
     */
    eapProperties {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info_array_ex">EAP_METHOD_INFO_ARRAY_EX</a> structure that contains information about all of the EAP methods installed on the client computer.
     * @type {Pointer<EAP_METHOD_INFO_ARRAY_EX>}
     */
    pInnerMethodInfoArray {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
