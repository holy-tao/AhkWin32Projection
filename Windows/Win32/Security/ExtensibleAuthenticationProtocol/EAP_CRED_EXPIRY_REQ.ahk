#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_CONFIG_INPUT_FIELD_DATA.ahk" { EAP_CONFIG_INPUT_FIELD_DATA }
#Import ".\EAP_CONFIG_INPUT_FIELD_ARRAY.ahk" { EAP_CONFIG_INPUT_FIELD_ARRAY }

/**
 * Contains both the old and new EAP credentials for credential expiry operations.
 * @remarks
 * The <b>EAP_CRED_EXPIRY_REQ</b> structure can be employed to support Single-Sign-On (SSO).
 * 
 * The <b>EAP_CRED_EXPIRY_REQ</b> structure is identical to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb530539(v=vs.85)">EAP_CRED_EXPIRY_RESP</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_cred_expiry_req
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_CRED_EXPIRY_REQ {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure that contains the old EAP credentials.
     */
    curCreds : EAP_CONFIG_INPUT_FIELD_ARRAY

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure that contains the new EAP credentials.
     */
    newCreds : EAP_CONFIG_INPUT_FIELD_ARRAY

}
