#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIXERCONTROL structure describes the state and metrics of a single control for an audio line. (mixercontrola)
 * @remarks
 * > [!NOTE]
  * > The mmeapi.h header defines MIXERCONTROL as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontrola
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIXERCONTROLA extends Win32Struct
{
    static sizeof => 112

    static packingSize => 1

    /**
     * Size, in bytes, of the <b>MIXERCONTROL</b> structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Audio mixer-defined identifier that uniquely refers to the control described by the <b>MIXERCONTROL</b> structure. This identifier can be in any format supported by the mixer device. An application should use this identifier only as an abstract handle. No two controls for a single mixer device can ever have the same control identifier.
     * @type {Integer}
     */
    dwControlID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Class of the control for which the identifier is specified in <b>dwControlID</b>. An application must use this information to display the appropriate control for input from the user. An application can also display tailored graphics based on the control class or search for a particular control class on a specific line. If an application does not know about a control class, this control must be ignored. There are eight control class classifications, each with one or more standard control types:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Descriptions</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CT_CLASS_CUSTOM"></a><a id="mixercontrol_ct_class_custom"></a><dl>
     * <dt><b>MIXERCONTROL_CT_CLASS_CUSTOM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIXERCONTROL_CONTROLTYPE_CUSTOM
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CT_CLASS_FADER"></a><a id="mixercontrol_ct_class_fader"></a><dl>
     * <dt><b>MIXERCONTROL_CT_CLASS_FADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIXERCONTROL_CONTROLTYPE_BASS MIXERCONTROL_CONTROLTYPE_EQUALIZER MIXERCONTROL_CONTROLTYPE_FADER MIXERCONTROL_CONTROLTYPE_TREBLE MIXERCONTROL_CONTROLTYPE_VOLUME
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CT_CLASS_LIST"></a><a id="mixercontrol_ct_class_list"></a><dl>
     * <dt><b>MIXERCONTROL_CT_CLASS_LIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIXERCONTROL_CONTROLTYPE_MIXER MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT MIXERCONTROL_CONTROLTYPE_MUX MIXERCONTROL_CONTROLTYPE_SINGLESELECT
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CT_CLASS_METER"></a><a id="mixercontrol_ct_class_meter"></a><dl>
     * <dt><b>MIXERCONTROL_CT_CLASS_METER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIXERCONTROL_CONTROLTYPE_BOOLEANMETER MIXERCONTROL_CONTROLTYPE_PEAKMETER MIXERCONTROL_CONTROLTYPE_SIGNEDMETER MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CT_CLASS_NUMBER"></a><a id="mixercontrol_ct_class_number"></a><dl>
     * <dt><b>MIXERCONTROL_CT_CLASS_NUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIXERCONTROL_CONTROLTYPE_DECIBELS MIXERCONTROL_CONTROLTYPE_PERCENT MIXERCONTROL_CONTROLTYPE_SIGNED MIXERCONTROL_CONTROLTYPE_UNSIGNED
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CT_CLASS_SLIDER"></a><a id="mixercontrol_ct_class_slider"></a><dl>
     * <dt><b>MIXERCONTROL_CT_CLASS_SLIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIXERCONTROL_CONTROLTYPE_PAN MIXERCONTROL_CONTROLTYPE_QSOUNDPAN MIXERCONTROL_CONTROLTYPE_SLIDER
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CT_CLASS_SWITCH"></a><a id="mixercontrol_ct_class_switch"></a><dl>
     * <dt><b>MIXERCONTROL_CT_CLASS_SWITCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIXERCONTROL_CONTROLTYPE_BOOLEAN MIXERCONTROL_CONTROLTYPE_BUTTON MIXERCONTROL_CONTROLTYPE_LOUDNESS MIXERCONTROL_CONTROLTYPE_MONO MIXERCONTROL_CONTROLTYPE_MUTE MIXERCONTROL_CONTROLTYPE_ONOFF MIXERCONTROL_CONTROLTYPE_STEREOENH
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CT_CLASS_TIME"></a><a id="mixercontrol_ct_class_time"></a><dl>
     * <dt><b>MIXERCONTROL_CT_CLASS_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIXERCONTROL_CONTROLTYPE_MICROTIME MIXERCONTROL_CONTROLTYPE_MILLITIME
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwControlType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Status and support flags for the audio line control. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CONTROLF_DISABLED"></a><a id="mixercontrol_controlf_disabled"></a><dl>
     * <dt><b>MIXERCONTROL_CONTROLF_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control is disabled, perhaps due to other settings for the mixer hardware, and cannot be used. An application can read current settings from a disabled control, but it cannot apply settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CONTROLF_MULTIPLE"></a><a id="mixercontrol_controlf_multiple"></a><dl>
     * <dt><b>MIXERCONTROL_CONTROLF_MULTIPLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control has two or more settings per channel. An equalizer, for example, requires this flag because each frequency band can be set to a different value. An equalizer that affects both channels of a stereo line in a uniform fashion will also specify the MIXERCONTROL_CONTROLF_UNIFORM flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERCONTROL_CONTROLF_UNIFORM"></a><a id="mixercontrol_controlf_uniform"></a><dl>
     * <dt><b>MIXERCONTROL_CONTROLF_UNIFORM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control acts on all channels of a multichannel line in a uniform fashion. For example, a control that mutes both channels of a stereo line would set this flag. Most MIXERCONTROL_CONTROLTYPE_MUX and MIXERCONTROL_CONTROLTYPE_MIXER controls also specify the MIXERCONTROL_CONTROLF_UNIFORM flag.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fdwControl {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of items per channel that make up a MIXERCONTROL_CONTROLF_MULTIPLE control. This number is always two or greater for multiple-item controls. If the control is not a multiple-item control, do not use this member; it will be zero.
     * @type {Integer}
     */
    cMultipleItems {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Short string that describes the audio line control specified by <b>dwControlID</b>. This description should be appropriate to use as a concise label for the control.
     * @type {Array<SByte>}
     */
    szShortName{
        get {
            if(!this.HasProp("__szShortNameProxyArray"))
                this.__szShortNameProxyArray := Win32FixedArray(this.ptr + 20, 16, Primitive, "char")
            return this.__szShortNameProxyArray
        }
    }

    /**
     * String that describes the audio line control specified by <b>dwControlID</b>. This description should be appropriate to use as a complete description for the control.
     * @type {Array<SByte>}
     */
    szName{
        get {
            if(!this.HasProp("__szNameProxyArray"))
                this.__szNameProxyArray := Win32FixedArray(this.ptr + 36, 64, Primitive, "char")
            return this.__szNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    lMinimum {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    lMaximum {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwMinimum {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    dwMaximum {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 100, 6, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    cSteps {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    cbCustomData {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }
}
