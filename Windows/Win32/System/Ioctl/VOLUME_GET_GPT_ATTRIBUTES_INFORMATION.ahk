#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains volume attributes retrieved with the IOCTL_VOLUME_GET_GPT_ATTRIBUTES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-volume_get_gpt_attributes_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class VOLUME_GET_GPT_ATTRIBUTES_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Specifies all of the attributes
     *     associated with a volume.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GPT_BASIC_DATA_ATTRIBUTE_READ_ONLY"></a><a id="gpt_basic_data_attribute_read_only"></a><dl>
     * <dt><b>GPT_BASIC_DATA_ATTRIBUTE_READ_ONLY</b></dt>
     * <dt>0x1000000000000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GPT_BASIC_DATA_ATTRIBUTE_SHADOW_COPY"></a><a id="gpt_basic_data_attribute_shadow_copy"></a><dl>
     * <dt><b>GPT_BASIC_DATA_ATTRIBUTE_SHADOW_COPY</b></dt>
     * <dt>0x2000000000000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume is a shadow copy of another volume. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-service-overview">Volume Shadow Copy Service Overview</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GPT_BASIC_DATA_ATTRIBUTE_HIDDEN"></a><a id="gpt_basic_data_attribute_hidden"></a><dl>
     * <dt><b>GPT_BASIC_DATA_ATTRIBUTE_HIDDEN</b></dt>
     * <dt>0x4000000000000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume is hidden.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GPT_BASIC_DATA_ATTRIBUTE_NO_DRIVE_LETTER"></a><a id="gpt_basic_data_attribute_no_drive_letter"></a><dl>
     * <dt><b>GPT_BASIC_DATA_ATTRIBUTE_NO_DRIVE_LETTER</b></dt>
     * <dt>0x8000000000000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume is not assigned a default drive letter.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    GptAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
