#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk

/**
 * Contains information that the IOCTL_CHANGER_QUERY_VOLUME_TAGS control code uses to determine the volume information to be retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_send_volume_tag_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_SEND_VOLUME_TAG_INFORMATION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that represents the starting element for which information is to be retrieved.
     * @type {CHANGER_ELEMENT}
     */
    StartingElement{
        get {
            if(!this.HasProp("__StartingElement"))
                this.__StartingElement := CHANGER_ELEMENT(0, this)
            return this.__StartingElement
        }
    }

    /**
     * The action to be performed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASSERT_ALTERNATE"></a><a id="assert_alternate"></a><dl>
     * <dt><b>ASSERT_ALTERNATE</b></dt>
     * <dt>0x9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Define the alternate volume tag of a volume that currently has none defined. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_ASSERT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASSERT_PRIMARY"></a><a id="assert_primary"></a><dl>
     * <dt><b>ASSERT_PRIMARY</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Define the primary volume tag of a volume that currently has none defined. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_ASSERT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REPLACE_ALTERNATE"></a><a id="replace_alternate"></a><dl>
     * <dt><b>REPLACE_ALTERNATE</b></dt>
     * <dt>0xB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replace the alternate volume tag with a new tag. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_REPLACE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REPLACE_PRIMARY"></a><a id="replace_primary"></a><dl>
     * <dt><b>REPLACE_PRIMARY</b></dt>
     * <dt>0xA</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replace the primary volume tag with a new tag. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_REPLACE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEARCH_ALL"></a><a id="search_all"></a><dl>
     * <dt><b>SEARCH_ALL</b></dt>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search all defined volume tags. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_SEARCH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEARCH_ALL_NO_SEQ"></a><a id="search_all_no_seq"></a><dl>
     * <dt><b>SEARCH_ALL_NO_SEQ</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search all defined volume tags, but ignore sequence numbers. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_SEARCH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEARCH_ALT_NO_SEQ"></a><a id="search_alt_no_seq"></a><dl>
     * <dt><b>SEARCH_ALT_NO_SEQ</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search only alternate volume tags, but ignore sequence numbers. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_SEARCH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEARCH_ALTERNATE"></a><a id="search_alternate"></a><dl>
     * <dt><b>SEARCH_ALTERNATE</b></dt>
     * <dt>02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search only alternate volume tags. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_SEARCH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEARCH_PRI_NO_SEQ"></a><a id="search_pri_no_seq"></a><dl>
     * <dt><b>SEARCH_PRI_NO_SEQ</b></dt>
     * <dt>05</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search only primary volume tags but ignore sequence numbers. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_SEARCH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEARCH_PRIMARY"></a><a id="search_primary"></a><dl>
     * <dt><b>SEARCH_PRIMARY</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search only primary volume tags. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_SEARCH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDEFINE_ALTERNATE"></a><a id="undefine_alternate"></a><dl>
     * <dt><b>UNDEFINE_ALTERNATE</b></dt>
     * <dt>0xD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Clear the alternate volume tag. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_UNDEFINE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDEFINE_PRIMARY"></a><a id="undefine_primary"></a><dl>
     * <dt><b>UNDEFINE_PRIMARY</b></dt>
     * <dt>0xC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Clear the primary volume tag. 
     * 
     * 
     * 
     * 
     * Requires that <b>Features0</b> is CHANGER_VOLUME_UNDEFINE.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ActionCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The template that the device uses to search for volume IDs. For search operations, the template can include wildcard characters to search for volumes that match the template. Supported wildcard characters include the asterisk (*) and question mark (?). For other operations, the template must specify a single volume.
     * @type {Array<Byte>}
     */
    VolumeIDTemplate{
        get {
            if(!this.HasProp("__VolumeIDTemplateProxyArray"))
                this.__VolumeIDTemplateProxyArray := Win32FixedArray(this.ptr + 12, 40, Primitive, "char")
            return this.__VolumeIDTemplateProxyArray
        }
    }
}
