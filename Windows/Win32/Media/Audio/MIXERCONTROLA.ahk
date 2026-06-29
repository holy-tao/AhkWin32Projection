#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The MIXERCONTROL structure describes the state and metrics of a single control for an audio line. (mixercontrola)
 * @remarks
 * > [!NOTE]
 * > The mmeapi.h header defines MIXERCONTROL as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontrola
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct MIXERCONTROLA {
    #StructPack 4


    struct _Bounds {
        lMinimum : Int32

        lMaximum : Int32

        static __New() {
            DefineProp(this.Prototype, 'dwMinimum', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'dwMaximum', { type: UInt32, offset: 4 })
            DefineProp(this.Prototype, 'dwReserved', { type: UInt32[6], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Metrics {
        cSteps : UInt32

        static __New() {
            DefineProp(this.Prototype, 'cbCustomData', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'dwReserved', { type: UInt32[6], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Size, in bytes, of the <b>MIXERCONTROL</b> structure.
     */
    cbStruct : UInt32

    /**
     * Audio mixer-defined identifier that uniquely refers to the control described by the <b>MIXERCONTROL</b> structure. This identifier can be in any format supported by the mixer device. An application should use this identifier only as an abstract handle. No two controls for a single mixer device can ever have the same control identifier.
     */
    dwControlID : UInt32

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
     */
    dwControlType : UInt32

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
     */
    fdwControl : UInt32

    /**
     * Number of items per channel that make up a MIXERCONTROL_CONTROLF_MULTIPLE control. This number is always two or greater for multiple-item controls. If the control is not a multiple-item control, do not use this member; it will be zero.
     */
    cMultipleItems : UInt32

    /**
     * Short string that describes the audio line control specified by <b>dwControlID</b>. This description should be appropriate to use as a concise label for the control.
     */
    szShortName : CHAR[16]

    /**
     * String that describes the audio line control specified by <b>dwControlID</b>. This description should be appropriate to use as a complete description for the control.
     */
    szName : CHAR[64]

    /**
     * Union of boundary types.
     */
    Bounds : MIXERCONTROLA._Bounds

    /**
     * Union of boundary metrics.
     */
    Metrics : MIXERCONTROLA._Metrics

}
