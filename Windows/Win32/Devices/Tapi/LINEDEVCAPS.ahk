#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LINEDIALPARAMS.ahk

/**
 * The LINEDEVCAPS structure describes the capabilities of a line device. The lineGetDevCaps function and the TSPI_lineGetDevCaps function return the LINEDEVCAPS structure.
 * @remarks
 * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
 * 
 * Older applications are compiled without new members in the 
 * <b>LINEDEVCAPS</b> structure, and using a SIZEOF LINEDEVCAPS smaller than the new size. The application passes in a <i>dwAPIVersion</i> parameter with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevcaps">lineGetDevCaps</a> function, which can be used for guidance by TAPI in handling this situation. If the application passes in a <b>dwTotalSize</b> member less than the size of the fixed portion of the structure as defined in the specified <b>dwAPIVersion</b>, LINEERR_STRUCTURETOOSMALL is returned. If sufficient memory has been allocated by the application, before calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_linegetdevcaps">TSPI_lineGetDevCaps</a>, TAPI sets the <b>dwNeededSize</b> and <b>dwUsedSize</b> members to the fixed size of the structure as it existed in the specified API version.
 * 
 * New applications must be cognizant of the API version negotiated, and not examine the contents of members in the fixed portion beyond the original end of the fixed portion of the structure for the negotiated API version.
 * 
 * If the LINEBEARERMODE_DATA bit is set in the <b>dwBearerModes</b> member, the <b>dwMaxRate</b> member indicates the maximum rate of digital transmission on the bearer channel. The <b>dwMaxRate</b> member of the 
 * <b>LINEDEVCAPS</b> structure can contain valid values even if the <b>dwBearerModes</b> member of the 
 * <b>LINEDEVCAPS</b> structure is not set to LINEBEARERMODE_DATA.
 * 
 * If LINEBEARERMODE_DATA is not set in <b>dwBearerModes</b>, but the LINEBEARERMODE_VOICE value is set and the LINEMEDIAMODE_DATAMODEM value is set in the <b>dwMediaModes</b> member, the <b>dwMaxRate</b> member indicates the maximum SYNCHRONOUS (DCE) bit rate on the phone line for the attached modem or functional equivalent. For example, if the modem's fastest modulation speed is V.32bis at 14,400bps, <b>dwMaxRate</b> equals 14400. This is not the fastest DTE port rate (which would most likely be 38400, 57600, or 115200), but the fastest bit rate the modem supports on the phone line.
 * 
 * The application must be careful to check to see that LINEBEARERMODE_DATA is not set, to avoid misinterpreting the <b>dwMaxRate</b> member. It is likely to be 64000 or higher if LINEBEARERMODE_DATA is set.
 * 
 * It should also be noted that if the modem has not been specifically identified (for example, it is a "generic" modem), the figure indicated is a "best guess" based on examination of the modem.
 * 
 * The members <b>dwSettableDevStatus</b> through <b>dwDeviceClassesOffset</b> are available only to applications that open the line device with a TAPI version of 2.0 or later.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linedevcaps
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEDEVCAPS extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size needed for this data structure to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size of the variably sized field containing service provider information, in bytes.
     * @type {Integer}
     */
    dwProviderInfoSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset from the beginning of the structure to the service provider information, in bytes. 
     * 
     * 
     * 
     * 
     * The <b>dwProviderInfoSize</b> and <b>dwProviderInfoOffset</b> members are intended to provide information about the provider hardware and/or software, such as the vendor name and version numbers of hardware and software. This information can be useful when a user needs to call customer service with problems regarding the provider.
     * @type {Integer}
     */
    dwProviderInfoOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of the variably sized device field containing switch information, in bytes.
     * @type {Integer}
     */
    dwSwitchInfoSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset from the beginning of the structure to the switch information, in bytes. 
     * 
     * 
     * 
     * 
     * The <b>dwSwitchInfoSize</b> and <b>dwSwitchInfoOffset</b> members are intended to provide information about the switch to which the line device is connected, such as the switch manufacturer, the model name, the software version, and so on. This information can be useful when a user needs to call customer service with problems regarding the switch.
     * @type {Integer}
     */
    dwSwitchInfoOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Permanent identifier by which the line device is known in the system's configuration. It is a permanent name for the line device. This permanent name (as opposed to <i>dwDeviceID</i>) does not change as lines are added or removed from the system, and persists through operating system upgrades. It can therefore be used to link line-specific information in .ini files (or other files) in a way that is not affected by adding or removing other lines or by changing the operating system.
     * @type {Integer}
     */
    dwPermanentLineID {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Size of the variably sized device field containing a user configurable name for this line device, in bytes.
     * @type {Integer}
     */
    dwLineNameSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Offset from the beginning of this data structure to the name for this line device. This name can be configured by the user when configuring the line device's service provider, and is provided for the user's convenience. The size of the field is specified by <b>dwLineNameSize</b>.
     * @type {Integer}
     */
    dwLineNameOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * String format used with this line device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/stringformat--constants">STRINGFORMAT_ Constants</a>.
     * @type {Integer}
     */
    dwStringFormat {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Mode by which the originating address is specified. This member uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressmode--constants">LINEADDRESSMODE_ Constants</a>.
     * @type {Integer}
     */
    dwAddressModes {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Number of addresses associated with this line device. Individual addresses are referred to by address identifiers. Address identifiers range from zero to one less than the value indicated by <b>dwNumAddresses</b>.
     * @type {Integer}
     */
    dwNumAddresses {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Flag array that indicates the different bearer modes that the address is able to support. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebearermode--constants">LINEBEARERMODE_ Constants</a>.
     * @type {Integer}
     */
    dwBearerModes {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Maximum data rate for information exchange over the call, in bits per second.
     * @type {Integer}
     */
    dwMaxRate {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Flag array that indicates the different media types the address is able to support. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     * @type {Integer}
     */
    dwMediaModes {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Tones that can be generated on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetonemode--constants">LINETONEMODE_ Constants</a>.
     * @type {Integer}
     */
    dwGenerateToneModes {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Maximum number of frequencies that can be specified in describing a general tone using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linegeneratetone">LINEGENERATETONE</a> data structure when generating a tone using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegeneratetone">lineGenerateTone</a>. A value of 0 indicates that tone generation is not available.
     * @type {Integer}
     */
    dwGenerateToneMaxNumFreq {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Digit modes than can be generated on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @type {Integer}
     */
    dwGenerateDigitModes {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Maximum number of frequencies that can be specified in describing a general tone using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemonitortone">LINEMONITORTONE</a> data structure when monitoring a general tone using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemonitortones">lineMonitorTones</a>. A value of 0 indicates that tone monitor is not available.
     * @type {Integer}
     */
    dwMonitorToneMaxNumFreq {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Maximum number of entries that can be specified in a tone list to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemonitortones">lineMonitorTones</a>.
     * @type {Integer}
     */
    dwMonitorToneMaxNumEntries {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Digit modes than can be detected on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @type {Integer}
     */
    dwMonitorDigitModes {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Minimum value that can be specified for both the first digit and inter-digit timeout values used by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegatherdigits">lineGatherDigits</a>, in milliseconds. If both <b>dwGatherDigitsMinTimeout</b> and <b>dwGatherDigitsMaxTimeout</b> are zero, timeouts are not supported.
     * @type {Integer}
     */
    dwGatherDigitsMinTimeout {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Maximum value that can be specified for both the first digit and inter-digit timeout values used by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegatherdigits">lineGatherDigits</a>, in milliseconds. If both <b>dwGatherDigitsMinTimeout</b> and <b>dwGatherDigitsMaxTimeout</b> are zero, timeouts are not supported.
     * @type {Integer}
     */
    dwGatherDigitsMaxTimeout {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Maximum number of entries that can be specified in the digit list parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a>.
     * @type {Integer}
     */
    dwMedCtlDigitMaxListSize {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Maximum number of entries that can be specified in the media list parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a>.
     * @type {Integer}
     */
    dwMedCtlMediaMaxListSize {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Maximum number of entries that can be specified in the tone list parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a>.
     * @type {Integer}
     */
    dwMedCtlToneMaxListSize {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Maximum number of entries that can be specified in the call state list parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a>.
     * @type {Integer}
     */
    dwMedCtlCallStateMaxListSize {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Boolean device capabilities. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevcapflags--constants">LINEDEVCAPFLAGS_ Constants</a>.
     * @type {Integer}
     */
    dwDevCapFlags {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Maximum number of (minimum bandwidth) calls that can be active (connected) on the line at any one time. The actual number of active calls may be lower if higher bandwidth calls have been established on the line.
     * @type {Integer}
     */
    dwMaxNumActiveCalls {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Effect on the active call when answering another offering call on a line device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineanswermode--constants">LINEANSWERMODE_ Constants</a>.
     * @type {Integer}
     */
    dwAnswerMode {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Number of different ring modes that can be reported in the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-linedevstate">LINE_LINEDEVSTATE</a> message with the <i>ringing</i> indication. Different ring modes range from one to <b>dwRingModes</b>. Zero indicates no ring.
     * @type {Integer}
     */
    dwRingModes {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Different line status components for which the application may be notified in a LINE_LINEDEVSTATE message on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevstate--constants">LINEDEVSTATE_ Constants</a>.
     * @type {Integer}
     */
    dwLineStates {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent during a call accept.
     * @type {Integer}
     */
    dwUUIAcceptSize {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent during a call answer.
     * @type {Integer}
     */
    dwUUIAnswerSize {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent during a make call.
     * @type {Integer}
     */
    dwUUIMakeCallSize {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent during a call drop.
     * @type {Integer}
     */
    dwUUIDropSize {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent separately any time during a call with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesenduseruserinfo">lineSendUserUserInfo</a>.
     * @type {Integer}
     */
    dwUUISendUserUserInfoSize {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be received in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> structure.
     * @type {Integer}
     */
    dwUUICallInfoSize {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Minimum value for the dial parameters that can be set for calls on this line, in milliseconds. Dialing parameters can be set to values in the range <b>MinDialParams</b> to <b>MaxDialParams</b>. The granularity of the actual settings is service provider-specific.
     * @type {LINEDIALPARAMS}
     */
    MinDialParams{
        get {
            if(!this.HasProp("__MinDialParams"))
                this.__MinDialParams := LINEDIALPARAMS(160, this)
            return this.__MinDialParams
        }
    }

    /**
     * Maximum value for the dial parameters that can be set for calls on this line, in milliseconds. Dialing parameters can be set to values in the range <b>MinDialParams</b> to <b>MaxDialParams</b>. The granularity of the actual settings is service provider-specific.
     * @type {LINEDIALPARAMS}
     */
    MaxDialParams{
        get {
            if(!this.HasProp("__MaxDialParams"))
                this.__MaxDialParams := LINEDIALPARAMS(176, this)
            return this.__MaxDialParams
        }
    }

    /**
     * Default dial parameters used for calls on this line. These parameter values can be overridden on a per-call basis.
     * @type {LINEDIALPARAMS}
     */
    DefaultDialParams{
        get {
            if(!this.HasProp("__DefaultDialParams"))
                this.__DefaultDialParams := LINEDIALPARAMS(192, this)
            return this.__DefaultDialParams
        }
    }

    /**
     * Number of terminals that can be set for this line device, its addresses, or its calls. Individual terminals are referred to by terminal IDs and range from zero to one less than the value indicated by <b>dwNumTerminals</b>.
     * @type {Integer}
     */
    dwNumTerminals {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * Size of the variably sized device field containing an array with entries of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetermcaps">LINETERMCAPS</a>, in bytes.
     * @type {Integer}
     */
    dwTerminalCapsSize {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * Offset from the beginning of this structure to the variably sized device field containing an array with entries of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetermcaps">LINETERMCAPS</a>. This array is indexed by terminal IDs, in the range from zero to <b>dwNumTerminals</b> minus one. Each entry in the array specifies the terminal device capabilities of the corresponding terminal. The size of the field is specified by <b>dwTerminalCapsSize</b>.
     * @type {Integer}
     */
    dwTerminalCapsOffset {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * Size of each of the terminal text descriptions, including the <b>null</b> terminator, pointed to by <b>dwTerminalTextSize</b> and <b>dwTerminalTextOffset</b>, in bytes.
     * @type {Integer}
     */
    dwTerminalTextEntrySize {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * Size of the variably sized field containing descriptive text about each of the line's available terminals, including the <b>null</b> terminator, in bytes
     * @type {Integer}
     */
    dwTerminalTextSize {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * Offset from the beginning of this structure to the descriptive text about each of the line's available terminals, in bytes. Each message is <b>dwTerminalTextEntrySize</b> bytes long. The string format of these textual descriptions is indicated by <b>dwStringFormat</b> in the line's device capabilities. The size of the field is specified by <b>dwTerminalTextSize</b>.
     * @type {Integer}
     */
    dwTerminalTextOffset {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * Size of the variably sized device-specific field, in bytes. If the device-specific information is a pointer to a string, the size must include the <b>null</b> terminator.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * Offset from the beginning of this structure to the device-specific field, in bytes. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * Features available for this line using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linefeature--constants">LINEFEATURE_ Constants</a>. Invoking a supported feature requires the line to be in the proper state and the underlying line device to be opened in a compatible mode. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the line is in the appropriate state for the operation to be meaningful. This member allows an application to discover which line features can be (and which can never be) supported by the device.
     * @type {Integer}
     */
    dwLineFeatures {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevstatusflags--constants">LINEDEVSTATUSFLAGS</a> values that can be modified using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetlinedevstatus">lineSetLineDevStatus</a>.
     * @type {Integer}
     */
    dwSettableDevStatus {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * Size of a string containing the device class identifiers supported on one or more addresses on this line, including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwDeviceClassesSize {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * Offset from the beginning of this structure to a string containing the device class identifiers supported on one or more addresses on this line, in bytes. These strings are for use with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a>; they are separated by <b>NULL</b>s, and the last identifier in the list is followed by two <b>NULL</b>s. The size of the field is specified by <b>dwDeviceClassesSize</b>.
     * @type {Integer}
     */
    dwDeviceClassesOffset {
        get => NumGet(this, 252, "uint")
        set => NumPut("uint", value, this, 252)
    }

    /**
     * GUID permanently associated with the line device.
     * @type {Pointer<Guid>}
     */
    PermanentLineGuid {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }
}
