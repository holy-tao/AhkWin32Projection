#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_INTERACTIVE_UI_DATA_TYPE.ahk" { EAP_INTERACTIVE_UI_DATA_TYPE }
#Import ".\EAP_UI_DATA_FORMAT.ahk" { EAP_UI_DATA_FORMAT }
#Import ".\EAP_CRED_EXPIRY_REQ.ahk" { EAP_CRED_EXPIRY_REQ }
#Import ".\EAP_CONFIG_INPUT_FIELD_ARRAY.ahk" { EAP_CONFIG_INPUT_FIELD_ARRAY }

/**
 * Contains configuration information for interactive UI components raised on an EAP supplicant.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_interactive_ui_data
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_INTERACTIVE_UI_DATA {
    #StructPack 8

    /**
     * The version of this data structure.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_INTERACTIVE_UI_DATA_VERSION"></a><a id="eap_interactive_ui_data_version"></a><dl>
     * <dt><b>EAP_INTERACTIVE_UI_DATA_VERSION</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version of the EAP interactive UI data.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * The size of this entire structure, in bytes.
     */
    dwSize : UInt32

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_interactive_ui_data_type">EAP_INTERACTIVE_UI_DATA_TYPE</a> value that specifies the type of data pointed to by <i>pbUiData</i>.
     */
    dwDataType : EAP_INTERACTIVE_UI_DATA_TYPE

    /**
     * The size of the data pointed to by <i>pbUiData</i>, in bytes.
     */
    cbUiData : UInt32

    /**
     * A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaptypes/ns-eaptypes-eap_ui_data_format">EAP_UI_DATA_FORMAT</a> union that contains information about specific user interface components that correspond to the type specified in <i>dwDataType</i>.
     */
    pbUiData : EAP_UI_DATA_FORMAT

}
