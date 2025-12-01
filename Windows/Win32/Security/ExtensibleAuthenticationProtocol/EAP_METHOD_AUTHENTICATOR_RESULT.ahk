#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains authentication results returned by an EAP authenticator method.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ns-eapauthenticatoractiondefine-eap_method_authenticator_result
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_AUTHENTICATOR_RESULT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * If <b>TRUE</b>, the supplicant was successfully authenticated; if <b>FALSE</b>, it was not.
     * @type {BOOL}
     */
    fIsSuccess {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Contains a reason code if the supplicant could not be authenticated. Reason codes are generally expected to originate from winerror.h.
     * @type {Integer}
     */
    dwFailureReason {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EAP_ATTRIBUTES</a> structure that contains the EAP attributes  returned by the authentication session.
     * @type {Pointer<EAP_ATTRIBUTES>}
     */
    pAuthAttribs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
