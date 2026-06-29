#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_CONFIG_INPUT_FIELD_DATA.ahk" { EAP_CONFIG_INPUT_FIELD_DATA }

/**
 * Contains a set of EAP_CONFIG_INPUT_FIELD_DATA structures that collectively contain the user input field data obtained from the user.
 * @remarks
 * The <b>EAP_CONFIG_INPUT_FIELD_ARRAY</b> structure can be employed to support Single-Sign-On (SSO).
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_config_input_field_array
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_CONFIG_INPUT_FIELD_ARRAY {
    #StructPack 8

    /**
     * The version of the <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_data">EAP_CONFIG_INPUT_FIELD_DATA</a>   structures pointed to by <b>pFields</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_CREDENTIAL_VERSION"></a><a id="eap_credential_version"></a><dl>
     * <dt><b>EAP_CREDENTIAL_VERSION</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version of the EAP credentials supplied by the user.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * The total number of elements in the array specified by  <b>pFields</b>.
     */
    dwNumberOfFields : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_data">EAP_CONFIG_INPUT_FIELD_DATA</a> structures that contain specific user input data obtained from an EAP configuration dialog box.
     */
    pFields : EAP_CONFIG_INPUT_FIELD_DATA.Ptr

}
