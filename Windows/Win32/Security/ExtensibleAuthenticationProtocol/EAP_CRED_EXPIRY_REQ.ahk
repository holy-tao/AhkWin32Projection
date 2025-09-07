#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EAP_CONFIG_INPUT_FIELD_ARRAY.ahk

/**
 * Contains both the old and new EAP credentials for credential expiry operations.
 * @remarks
 * The <b>EAP_CRED_EXPIRY_REQ</b> structure can be employed to support Single-Sign-On (SSO).
  * 
  * The <b>EAP_CRED_EXPIRY_REQ</b> structure is identical to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb530539(v=vs.85)">EAP_CRED_EXPIRY_RESP</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_cred_expiry_req
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_CRED_EXPIRY_REQ extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure that contains the old EAP credentials.
     * @type {EAP_CONFIG_INPUT_FIELD_ARRAY}
     */
    curCreds{
        get {
            if(!this.HasProp("__curCreds"))
                this.__curCreds := EAP_CONFIG_INPUT_FIELD_ARRAY(this.ptr + 0)
            return this.__curCreds
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure that contains the new EAP credentials.
     * @type {EAP_CONFIG_INPUT_FIELD_ARRAY}
     */
    newCreds{
        get {
            if(!this.HasProp("__newCreds"))
                this.__newCreds := EAP_CONFIG_INPUT_FIELD_ARRAY(this.ptr + 16)
            return this.__newCreds
        }
    }
}
