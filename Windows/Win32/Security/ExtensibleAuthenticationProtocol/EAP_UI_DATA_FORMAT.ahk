#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_CRED_EXPIRY_REQ.ahk" { EAP_CRED_EXPIRY_REQ }
#Import ".\EAP_CONFIG_INPUT_FIELD_ARRAY.ahk" { EAP_CONFIG_INPUT_FIELD_ARRAY }

/**
 * The EAP_UI_DATA_FORMAT union specifies the value of the attribute stored in the pbUiData member of the EAP_INTERACTIVE_UI_DATA structure.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_ui_data_format
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_UI_DATA_FORMAT {
    #StructPack 8

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
     */
    credData : EAP_CONFIG_INPUT_FIELD_ARRAY.Ptr

    static __New() {
        DefineProp(this.Prototype, 'credExpiryData', { type: EAP_CRED_EXPIRY_REQ.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'credLogonData', { type: EAP_CONFIG_INPUT_FIELD_ARRAY.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }
}
