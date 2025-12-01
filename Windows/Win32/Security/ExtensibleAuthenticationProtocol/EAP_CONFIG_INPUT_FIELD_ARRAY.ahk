#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a set of EAP_CONFIG_INPUT_FIELD_DATA structures that collectively contain the user input field data obtained from the user.
 * @remarks
 * The <b>EAP_CONFIG_INPUT_FIELD_ARRAY</b> structure can be employed to support Single-Sign-On (SSO).
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_config_input_field_array
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_CONFIG_INPUT_FIELD_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of elements in the array specified by  <b>pFields</b>.
     * @type {Integer}
     */
    dwNumberOfFields {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_data">EAP_CONFIG_INPUT_FIELD_DATA</a> structures that contain specific user input data obtained from an EAP configuration dialog box.
     * @type {Pointer<EAP_CONFIG_INPUT_FIELD_DATA>}
     */
    pFields {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
