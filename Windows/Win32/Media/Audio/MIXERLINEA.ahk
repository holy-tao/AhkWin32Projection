#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIXERLINE structure describes the state and metrics of an audio line. (MIXERLINEA)
 * @remarks
 * > [!NOTE]
  * > The mmeapi.h header defines MIXERLINE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixerlinea
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIXERLINEA extends Win32Struct
{
    static sizeof => 204

    static packingSize => 1

    /**
     * Size, in bytes, of the <b>MIXERLINE</b> structure. This member must be initialized before calling the <a href="https://docs.microsoft.com/previous-versions/dd757303(v=vs.85)">mixerGetLineInfo</a> function. The size specified in this member must be large enough to contain the <b>MIXERLINE</b> structure. When <b>mixerGetLineInfo</b> returns, this member contains the actual size of the information returned. The returned information will not exceed the requested size.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Destination line index. This member ranges from zero to one less than the value specified in the <b>cDestinations</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure retrieved by the <a href="https://docs.microsoft.com/previous-versions/dd757300(v=vs.85)">mixerGetDevCaps</a> function. When the <a href="https://docs.microsoft.com/previous-versions/dd757303(v=vs.85)">mixerGetLineInfo</a> function is called with the MIXER_GETLINEINFOF_DESTINATION flag, properties for the destination line are returned. (The <b>dwSource</b> member must be set to zero in this case.) When called with the MIXER_GETLINEINFOF_SOURCE flag, the properties for the source given by the <b>dwSource</b> member that is associated with the <b>dwDestination</b> member are returned.
     * @type {Integer}
     */
    dwDestination {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Index for the audio source line associated with the <b>dwDestination</b> member. That is, this member specifies the <i>n</i>th audio source line associated with the specified audio destination line. This member is not used for destination lines and must be set to zero when MIXER_GETLINEINFOF_DESTINATION is specified in the <a href="https://docs.microsoft.com/previous-versions/dd757303(v=vs.85)">mixerGetLineInfo</a> function. When the MIXER_GETLINEINFOF_SOURCE flag is specified, this member ranges from zero to one less than the value specified in the <b>cConnections</b> member for the audio destination line given in the <b>dwDestination</b> member.
     * @type {Integer}
     */
    dwSource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An identifier defined by the mixer device that uniquely refers to the audio line described by the <b>MIXERLINE</b> structure. This identifier is unique for each mixer device and can be in any format. An application should use this identifier only as an abstract handle.
     * @type {Integer}
     */
    dwLineID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Status and support flags for the audio line. This member is always returned to the application and requires no initialization.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERLINE_LINEF_ACTIVE"></a><a id="mixerline_linef_active"></a><dl>
     * <dt><b>MIXERLINE_LINEF_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio line is active. An active line indicates that a signal is probably passing through the line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERLINE_LINEF_DISCONNECTED"></a><a id="mixerline_linef_disconnected"></a><dl>
     * <dt><b>MIXERLINE_LINEF_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio line is disconnected. A disconnected line's associated controls can still be modified, but the changes have no effect until the line is connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIXERLINE_LINEF_SOURCE"></a><a id="mixerline_linef_source"></a><dl>
     * <dt><b>MIXERLINE_LINEF_SOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio line is an audio source line associated with a single audio destination line. If this flag is not set, this line is an audio destination line associated with zero or more audio source lines.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If an application is not using a waveform-audio output device, the audio line associated with that device would not be active (that is, the MIXERLINE_LINEF_ACTIVE flag would not be set).
     * 
     * If the waveform-audio output device is opened, then the audio line is considered active and the MIXERLINE_LINEF_ACTIVE flag will be set. 
     * 
     * A paused or starved waveform-audio output device is still considered active. In other words, if the waveform-audio output device is opened by an application regardless of whether data is being played, the associated audio line is considered active. 
     * 
     * If a line cannot be strictly defined as active, the mixer device will always set the MIXERLINE_LINEF_ACTIVE flag.
     * @type {Integer}
     */
    fdwLine {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Instance data defined by the audio device for the line. This member is intended for custom mixer applications designed specifically for the mixer device returning this information. Other applications should ignore this data.
     * @type {Pointer}
     */
    dwUser {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    dwComponentType {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Maximum number of separate channels that can be manipulated independently for the audio line. The minimum value for this field is 1 because a line must have at least one channel. 
     * 
     * Most modern audio cards for personal computers are stereo devices; for them, the value of this member is 2.
     * 
     * Channel 1 is assumed to be the left channel; channel 2 is assumed to be the right channel. 
     * 
     * A multichannel line might have one or more uniform controls (controls that affect all channels of a line uniformly) associated with it.
     * @type {Integer}
     */
    cChannels {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Number of connections that are associated with the audio line. This member is used only for audio destination lines and specifies the number of audio source lines that are associated with it. This member is always zero for source lines and for destination lines that do not have any audio source lines associated with them.
     * @type {Integer}
     */
    cConnections {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Number of controls associated with the audio line. This value can be zero. If no controls are associated with the line, the line is likely to be a source that might be selected in a MIXERCONTROL_CONTROLTYPE_MUX or MIXERCONTROL_CONTROLTYPE_MIXER but allows no manipulation of the signal.
     * @type {Integer}
     */
    cControls {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Short string that describes the audio mixer line specified in the <b>dwLineID</b> member. This description should be appropriate as a concise label for the line.
     * @type {String}
     */
    szShortName {
        get => StrGet(this.ptr + 44, 15, "UTF-8")
        set => StrPut(value, this.ptr + 44, 15, "UTF-8")
    }

    /**
     * String that describes the audio mixer line specified in the <b>dwLineID</b> member. This description should be appropriate as a complete description for the line.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 60, 63, "UTF-8")
        set => StrPut(value, this.ptr + 60, 63, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    dwDeviceID {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 132, "ushort")
        set => NumPut("ushort", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 134, "ushort")
        set => NumPut("ushort", value, this, 134)
    }

    /**
     * @type {Integer}
     */
    vDriverVersion {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {String}
     */
    szPname {
        get => StrGet(this.ptr + 140, 31, "UTF-16")
        set => StrPut(value, this.ptr + 140, 31, "UTF-16")
    }
}
