#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the data associated with a single input field.
 * @remarks
 * The <b>EAP_CONFIG_INPUT_FIELD_DATA</b> structure can be employed to support SSO.
  * 
  * This structure represents the data associated with a single input field in an EAP configuration dialog box. For example, it could contain the data for the "Login User" as supplied by the EAP application user.
  * 
  * The entire collection of input fields in a EAP configuration dialog box is represented by a <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_config_input_field_data
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_CONFIG_INPUT_FIELD_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of the <b>EAP_CONFIG_INPUT_FIELD_DATA</b> structure. This field is used for versioning purposes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_config_input_field_type">EAP_CONFIG_INPUT_FIELD_TYPE</a> enumeration value that specifies the type of the input field.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A set of flag values that describe properties of the EAP configuration input field.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_UI_INPUT_FIELD_PROPS_DEFAULT"></a><a id="eap_ui_input_field_props_default"></a><dl>
     * <dt><b>EAP_UI_INPUT_FIELD_PROPS_DEFAULT</b></dt>
     * <dt>0X00000000
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Vista with SP1 or later: Represents the default property value for input field entries displayed in the UI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_CONFIG_INPUT_FIELD_PROPS_DEFAULT"></a><a id="eap_config_input_field_props_default"></a><dl>
     * <dt><b>EAP_CONFIG_INPUT_FIELD_PROPS_DEFAULT</b></dt>
     * <dt>0X00000000
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Represents the default property value for configuration input field entries displayed in the UI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_UI_INPUT_FIELD_PROPS_NON_DISPLAYABLE"></a><a id="eap_ui_input_field_props_non_displayable"></a><dl>
     * <dt><b>EAP_UI_INPUT_FIELD_PROPS_NON_DISPLAYABLE</b></dt>
     * <dt>0X00000001
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Vista with SP1 or later: Specifies that input field entries will not be displayed in the UI (a password or PIN number, for example).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_CONFIG_INPUT_FIELD_PROPS_NON_DISPLAYABLE"></a><a id="eap_config_input_field_props_non_displayable"></a><dl>
     * <dt><b>EAP_CONFIG_INPUT_FIELD_PROPS_NON_DISPLAYABLE</b></dt>
     * <dt>0X00000001
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that configuration input field entries will not be displayed in the UI (a password or PIN number, for example).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_UI_INPUT_FIELD_PROPS_NON_PERSIST"></a><a id="eap_ui_input_field_props_non_persist"></a><dl>
     * <dt><b>EAP_UI_INPUT_FIELD_PROPS_NON_PERSIST</b></dt>
     * <dt>0X00000002
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Vista with SP1 or later: Indicates that the EAP method will not cache the field data; the supplicant must cache the field data for roaming.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_CONFIG_INPUT_FIELD_PROPS_NON_PERSIST"></a><a id="eap_config_input_field_props_non_persist"></a><dl>
     * <dt><b>EAP_CONFIG_INPUT_FIELD_PROPS_NON_PERSIST</b></dt>
     * <dt>0X00000002
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the EAP method will not cache the field data; the supplicant must cache the field data for roaming.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAP_UI_INPUT_FIELD_PROPS_READ_ONLY"></a><a id="eap_ui_input_field_props_read_only"></a><dl>
     * <dt><b>EAP_UI_INPUT_FIELD_PROPS_READ_ONLY</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Vista with SP1 or later: Indicates that the input field is read-only and cannot be edited.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlagProps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a zero-terminated Unicode string that contains the label for the input field. The caller must free the inner pointers
     *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAX_EAP_CONFIG_INPUT_FIELD_LENGTH"></a><a id="max_eap_config_input_field_length"></a><dl>
     * <dt><b>MAX_EAP_CONFIG_INPUT_FIELD_LENGTH</b></dt>
     * <dt>256</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the maximum supported length of an input field.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {PWSTR}
     */
    pwszLabel{
        get {
            if(!this.HasProp("__pwszLabel"))
                this.__pwszLabel := PWSTR(this.ptr + 16)
            return this.__pwszLabel
        }
    }

    /**
     * A pointer to a zero-terminated  Unicode string that contains the data entered by the user into the input field. This value is initially empty. It is populated in a Single-Sign-On (SSO) scenario and returned to EAPHost with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuserblobfromcredentialinputfields">EapHostPeerQueryUserBlobFromCredentialInputFields</a>. The caller must free the inner pointers
     *                 using the function EapHostPeerFreeMemory, starting at the innermost pointer.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAX_EAP_CONFIG_INPUT_FIELD_VALUE_LENGTH"></a><a id="max_eap_config_input_field_value_length"></a><dl>
     * <dt><b>MAX_EAP_CONFIG_INPUT_FIELD_VALUE_LENGTH</b></dt>
     * <dt>1024</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the maximum supported length of an input field.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {PWSTR}
     */
    pwszData{
        get {
            if(!this.HasProp("__pwszData"))
                this.__pwszData := PWSTR(this.ptr + 24)
            return this.__pwszData
        }
    }

    /**
     * The minimum length, in bytes, allowed for data entered  by the user into the EAP configuration dialog box input field.
     * @type {Integer}
     */
    dwMinDataLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The maximum length, in bytes, allowed for data entered by the user into the EAP configuration dialog box input field.
     * @type {Integer}
     */
    dwMaxDataLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
