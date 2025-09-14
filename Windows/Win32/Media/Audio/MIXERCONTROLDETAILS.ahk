#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIXERCONTROLDETAILS structure refers to control-detail structures, retrieving or setting state information of an audio mixer control. (MIXERCONTROLDETAILS)
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontroldetails
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIXERCONTROLDETAILS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 1

    /**
     * Size, in bytes, of the <b>MIXERCONTROLDETAILS</b> structure. The size must be large enough to contain the base <b>MIXERCONTROLDETAILS</b> structure. When <a href="https://docs.microsoft.com/previous-versions/dd757299(v=vs.85)">mixerGetControlDetails</a> returns, this member contains the actual size of the information returned. The returned information will not exceed the requested size, nor will it be smaller than the base <b>MIXERCONTROLDETAILS</b> structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Control identifier on which to get or set properties.
     * @type {Integer}
     */
    dwControlID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of channels on which to get or set control properties. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use this value when the control is a MIXERCONTROL_CONTROLTYPE_CUSTOM control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use this value when the control is a MIXERCONTROL_CONTROLF_UNIFORM control or when an application needs to get and set all channels as if they were uniform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERLINE_cChannels"></a><a id="mixerline_cchannels"></a><a id="MIXERLINE_CCHANNELS"></a><dl>
     * <dt><b>MIXERLINE cChannels</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use this value when the properties for the control are expected on all channels for a line.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * An application cannot specify a value that falls between 1 and the number of channels for the audio line. For example, specifying 2 or 3 for a four-channel line is not valid. This member cannot be 0 for noncustom control types.
     * 
     * 
     * This member cannot be 0 for noncustom control types.
     * @type {Integer}
     */
    cChannels {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<HWND>}
     */
    hwndOwner {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    cMultipleItems {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size, in bytes, of one of the following details structures being used:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROLDETAILS_BOOLEAN"></a><a id="mixercontroldetails_boolean"></a><dl>
     * <dt><b>MIXERCONTROLDETAILS_BOOLEAN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Boolean value for an audio line control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROLDETAILS_LISTTEXT"></a><a id="mixercontroldetails_listtext"></a><dl>
     * <dt><b>MIXERCONTROLDETAILS_LISTTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * List text buffer for an audio line control. For information about the appropriate details structure for a specific control, see <a href="https://docs.microsoft.com/windows/desktop/Multimedia/control-types">Control Types</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROLDETAILS_SIGNED"></a><a id="mixercontroldetails_signed"></a><dl>
     * <dt><b>MIXERCONTROLDETAILS_SIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Signed value for an audio line control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROLDETAILS_UNSIGNED"></a><a id="mixercontroldetails_unsigned"></a><dl>
     * <dt><b>MIXERCONTROLDETAILS_UNSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unsigned value for an audio line control.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    cbDetails {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to an array of one or more structures in which properties for 
     * 				the specified control are retrieved or set. 
     * 
     * For MIXERCONTROL_CONTROLF_MULTIPLE controls, the size of this buffer should be the product of the <b>cChannels</b>, <b>cMultipleItems</b> and <b>cbDetails</b> members of the <b>MIXERCONTROLDETAILS</b> structure. For controls other than MIXERCONTROL_CONTROLF_MULTIPLE types, the size of this buffer is the product of the <b>cChannels</b> and <b>cbDetails</b> members of the <b>MIXERCONTROLDETAILS</b> structure.
     * 
     * For controls other than MIXERCONTROL_CONTROLF_MULTIPLE types, the size of this buffer is the product of the <b>cChannels</b> and <b>cbDetails</b> members of the <b>MIXERCONTROLDETAILS</b> structure. For controls other than MIXERCONTROL_CONTROLF_MULTIPLE types, the size of this buffer is the product of the <b>cChannels</b> and <b>cbDetails</b> members of the <b>MIXERCONTROLDETAILS</b> structure.
     * 
     * For controls that are MIXERCONTROL_CONTROLF_MULTIPLE types, the array can be treated as a two-dimensional array that is channel major. That is, all multiple items for the left channel are given, then all multiple items for the right channel, and so on.
     * 
     * For controls other than MIXERCONTROL_CONTROLF_MULTIPLE types, each element index is equivalent to the zero-based channel that it affects. That is, paDetails[0] is for the left channel and paDetails[1] is for the right channel.
     * 
     * If the control is a MIXERCONTROL_CONTROLTYPE_CUSTOM control, this member must point to a buffer that is at least large enough to contain the size, in bytes, specified by the cbCustomData member of the MIXERCONTROL structure.
     * @type {Pointer<Void>}
     */
    paDetails {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }
}
