#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EAP_UI_DATA_FORMAT.ahk

/**
 * Contains configuration information for interactive UI components raised on an EAP supplicant.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eap_interactive_ui_data
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_INTERACTIVE_UI_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

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
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this entire structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_interactive_ui_data_type">EAP_INTERACTIVE_UI_DATA_TYPE</a> value that specifies the type of data pointed to by <i>pbUiData</i>.
     * @type {Integer}
     */
    dwDataType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The size of the data pointed to by <i>pbUiData</i>, in bytes.
     * @type {Integer}
     */
    cbUiData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaptypes/ns-eaptypes-eap_ui_data_format">EAP_UI_DATA_FORMAT</a> union that contains information about specific user interface components that correspond to the type specified in <i>dwDataType</i>.
     * @type {EAP_UI_DATA_FORMAT}
     */
    pbUiData{
        get {
            if(!this.HasProp("__pbUiData"))
                this.__pbUiData := EAP_UI_DATA_FORMAT(16, this)
            return this.__pbUiData
        }
    }
}
