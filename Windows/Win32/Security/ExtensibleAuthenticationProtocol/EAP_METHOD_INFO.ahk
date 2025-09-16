#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EAP_TYPE.ahk
#Include .\EAP_METHOD_TYPE.ahk

/**
 * Contains information about an EAP method. (EAP_METHOD_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_info
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that identifies the EAP method.
     * @type {EAP_METHOD_TYPE}
     */
    eaptype{
        get {
            if(!this.HasProp("__eaptype"))
                this.__eaptype := EAP_METHOD_TYPE(this.ptr + 0)
            return this.__eaptype
        }
    }

    /**
     * Pointer to a zero-terminated Unicode string that contains the name of the EAP method's author.
     * @type {Pointer<PWSTR>}
     */
    pwszAuthorName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a zero-terminated Unicode string that contains the display name of the EAP method.
     * @type {Pointer<PWSTR>}
     */
    pwszFriendlyName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Set of flags that describe specific properties of the EAP method. For flag descriptions, see [EAP Method Properties](/windows/win32/eaphost/eap-method-properties).
     * @type {Integer}
     */
    eapProperties {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to an <b>EAP_METHOD_INFO</b> structure that contains information about the inner method.
     * @type {Pointer<EAP_METHOD_INFO>}
     */
    pInnerMethodInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
