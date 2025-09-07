#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The EAP_UI_DATA_FORMAT union specifies the value of the attribute stored in the pbUiData member of the EAP_INTERACTIVE_UI_DATA structure.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_ui_data_format
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_UI_DATA_FORMAT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * case(<i>EapCredReq</i>)
     * 
     * If [EAP_CRED_REQ](/windows/win32/eaphost/eap-cred-req)structure. 
     * 
     *  
     * 
     * 
     * case(<i>EapCredResp</i>)
     * 
     * If [EAP_CRED_RESP](/windows/win32/eaphost/eap-cred-resp) structure
     * @type {Pointer<EAP_CONFIG_INPUT_FIELD_ARRAY>}
     */
    credData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * case(<i>eapCredExpiryReq</i>)
     * 
     * If <i>dwDataType</i> specifies a credential expiry request (<i>eapCredExpiryReq</i>), then the data pointed to by this parameter is defined by <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_cred_expiry_req">EAP_CRED_EXPIRY_REQ </a> structure.
     * 
     * case(<i>eapCredExpiryResp</i>)
     * 
     * If <i>dwDataType</i> specifies a credential expiry response type (<i>eapCredExpiryResp</i>), then this parameter is defined by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb530539(v=vs.85)">EAP_CRED_EXPIRY_RESP</a> structure
     * @type {Pointer<EAP_CRED_EXPIRY_REQ>}
     */
    credExpiryData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * case(<i>EapCredLogonReq</i>)
     * 
     * If [EAP_CRED_LOGON_REQ](/windows/win32/eaphost/eap-cred-logon-req) structure. 
     * 
     * 
     * case(<i>EapCredLogonResp</i>)
     * 
     * If [EAP_CRED_LOGON_RESP](/windows/win32/eaphost/eap-cred-logon-resp) structure
     * @type {Pointer<EAP_CONFIG_INPUT_FIELD_ARRAY>}
     */
    credLogonData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
