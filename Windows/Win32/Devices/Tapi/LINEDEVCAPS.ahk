#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\LINEDIALPARAMS.ahk" { LINEDIALPARAMS }

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
 */
export default struct LINEDEVCAPS {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size needed for this data structure to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Size of the variably sized field containing service provider information, in bytes.
     */
    dwProviderInfoSize : UInt32

    /**
     * Offset from the beginning of the structure to the service provider information, in bytes. 
     * 
     * 
     * 
     * 
     * The <b>dwProviderInfoSize</b> and <b>dwProviderInfoOffset</b> members are intended to provide information about the provider hardware and/or software, such as the vendor name and version numbers of hardware and software. This information can be useful when a user needs to call customer service with problems regarding the provider.
     */
    dwProviderInfoOffset : UInt32

    /**
     * Size of the variably sized device field containing switch information, in bytes.
     */
    dwSwitchInfoSize : UInt32

    /**
     * Offset from the beginning of the structure to the switch information, in bytes. 
     * 
     * 
     * 
     * 
     * The <b>dwSwitchInfoSize</b> and <b>dwSwitchInfoOffset</b> members are intended to provide information about the switch to which the line device is connected, such as the switch manufacturer, the model name, the software version, and so on. This information can be useful when a user needs to call customer service with problems regarding the switch.
     */
    dwSwitchInfoOffset : UInt32

    /**
     * Permanent identifier by which the line device is known in the system's configuration. It is a permanent name for the line device. This permanent name (as opposed to <i>dwDeviceID</i>) does not change as lines are added or removed from the system, and persists through operating system upgrades. It can therefore be used to link line-specific information in .ini files (or other files) in a way that is not affected by adding or removing other lines or by changing the operating system.
     */
    dwPermanentLineID : UInt32

    /**
     * Size of the variably sized device field containing a user configurable name for this line device, in bytes.
     */
    dwLineNameSize : UInt32

    /**
     * Offset from the beginning of this data structure to the name for this line device. This name can be configured by the user when configuring the line device's service provider, and is provided for the user's convenience. The size of the field is specified by <b>dwLineNameSize</b>.
     */
    dwLineNameOffset : UInt32

    /**
     * String format used with this line device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/stringformat--constants">STRINGFORMAT_ Constants</a>.
     */
    dwStringFormat : UInt32

    /**
     * Mode by which the originating address is specified. This member uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressmode--constants">LINEADDRESSMODE_ Constants</a>.
     */
    dwAddressModes : UInt32

    /**
     * Number of addresses associated with this line device. Individual addresses are referred to by address identifiers. Address identifiers range from zero to one less than the value indicated by <b>dwNumAddresses</b>.
     */
    dwNumAddresses : UInt32

    /**
     * Flag array that indicates the different bearer modes that the address is able to support. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebearermode--constants">LINEBEARERMODE_ Constants</a>.
     */
    dwBearerModes : UInt32

    /**
     * Maximum data rate for information exchange over the call, in bits per second.
     */
    dwMaxRate : UInt32

    /**
     * Flag array that indicates the different media types the address is able to support. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     */
    dwMediaModes : UInt32

    /**
     * Tones that can be generated on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetonemode--constants">LINETONEMODE_ Constants</a>.
     */
    dwGenerateToneModes : UInt32

    /**
     * Maximum number of frequencies that can be specified in describing a general tone using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linegeneratetone">LINEGENERATETONE</a> data structure when generating a tone using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegeneratetone">lineGenerateTone</a>. A value of 0 indicates that tone generation is not available.
     */
    dwGenerateToneMaxNumFreq : UInt32

    /**
     * Digit modes than can be generated on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     */
    dwGenerateDigitModes : UInt32

    /**
     * Maximum number of frequencies that can be specified in describing a general tone using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemonitortone">LINEMONITORTONE</a> data structure when monitoring a general tone using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemonitortones">lineMonitorTones</a>. A value of 0 indicates that tone monitor is not available.
     */
    dwMonitorToneMaxNumFreq : UInt32

    /**
     * Maximum number of entries that can be specified in a tone list to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemonitortones">lineMonitorTones</a>.
     */
    dwMonitorToneMaxNumEntries : UInt32

    /**
     * Digit modes than can be detected on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     */
    dwMonitorDigitModes : UInt32

    /**
     * Minimum value that can be specified for both the first digit and inter-digit timeout values used by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegatherdigits">lineGatherDigits</a>, in milliseconds. If both <b>dwGatherDigitsMinTimeout</b> and <b>dwGatherDigitsMaxTimeout</b> are zero, timeouts are not supported.
     */
    dwGatherDigitsMinTimeout : UInt32

    /**
     * Maximum value that can be specified for both the first digit and inter-digit timeout values used by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegatherdigits">lineGatherDigits</a>, in milliseconds. If both <b>dwGatherDigitsMinTimeout</b> and <b>dwGatherDigitsMaxTimeout</b> are zero, timeouts are not supported.
     */
    dwGatherDigitsMaxTimeout : UInt32

    /**
     * Maximum number of entries that can be specified in the digit list parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a>.
     */
    dwMedCtlDigitMaxListSize : UInt32

    /**
     * Maximum number of entries that can be specified in the media list parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a>.
     */
    dwMedCtlMediaMaxListSize : UInt32

    /**
     * Maximum number of entries that can be specified in the tone list parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a>.
     */
    dwMedCtlToneMaxListSize : UInt32

    /**
     * Maximum number of entries that can be specified in the call state list parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a>.
     */
    dwMedCtlCallStateMaxListSize : UInt32

    /**
     * Boolean device capabilities. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevcapflags--constants">LINEDEVCAPFLAGS_ Constants</a>.
     */
    dwDevCapFlags : UInt32

    /**
     * Maximum number of (minimum bandwidth) calls that can be active (connected) on the line at any one time. The actual number of active calls may be lower if higher bandwidth calls have been established on the line.
     */
    dwMaxNumActiveCalls : UInt32

    /**
     * Effect on the active call when answering another offering call on a line device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineanswermode--constants">LINEANSWERMODE_ Constants</a>.
     */
    dwAnswerMode : UInt32

    /**
     * Number of different ring modes that can be reported in the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-linedevstate">LINE_LINEDEVSTATE</a> message with the <i>ringing</i> indication. Different ring modes range from one to <b>dwRingModes</b>. Zero indicates no ring.
     */
    dwRingModes : UInt32

    /**
     * Different line status components for which the application may be notified in a LINE_LINEDEVSTATE message on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevstate--constants">LINEDEVSTATE_ Constants</a>.
     */
    dwLineStates : UInt32

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent during a call accept.
     */
    dwUUIAcceptSize : UInt32

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent during a call answer.
     */
    dwUUIAnswerSize : UInt32

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent during a make call.
     */
    dwUUIMakeCallSize : UInt32

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent during a call drop.
     */
    dwUUIDropSize : UInt32

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be sent separately any time during a call with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesenduseruserinfo">lineSendUserUserInfo</a>.
     */
    dwUUISendUserUserInfoSize : UInt32

    /**
     * Maximum size of user-user information, including the <b>null</b> terminator, that can be received in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> structure.
     */
    dwUUICallInfoSize : UInt32

    /**
     * Minimum value for the dial parameters that can be set for calls on this line, in milliseconds. Dialing parameters can be set to values in the range <b>MinDialParams</b> to <b>MaxDialParams</b>. The granularity of the actual settings is service provider-specific.
     */
    MinDialParams : LINEDIALPARAMS

    /**
     * Maximum value for the dial parameters that can be set for calls on this line, in milliseconds. Dialing parameters can be set to values in the range <b>MinDialParams</b> to <b>MaxDialParams</b>. The granularity of the actual settings is service provider-specific.
     */
    MaxDialParams : LINEDIALPARAMS

    /**
     * Default dial parameters used for calls on this line. These parameter values can be overridden on a per-call basis.
     */
    DefaultDialParams : LINEDIALPARAMS

    /**
     * Number of terminals that can be set for this line device, its addresses, or its calls. Individual terminals are referred to by terminal IDs and range from zero to one less than the value indicated by <b>dwNumTerminals</b>.
     */
    dwNumTerminals : UInt32

    /**
     * Size of the variably sized device field containing an array with entries of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetermcaps">LINETERMCAPS</a>, in bytes.
     */
    dwTerminalCapsSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized device field containing an array with entries of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetermcaps">LINETERMCAPS</a>. This array is indexed by terminal IDs, in the range from zero to <b>dwNumTerminals</b> minus one. Each entry in the array specifies the terminal device capabilities of the corresponding terminal. The size of the field is specified by <b>dwTerminalCapsSize</b>.
     */
    dwTerminalCapsOffset : UInt32

    /**
     * Size of each of the terminal text descriptions, including the <b>null</b> terminator, pointed to by <b>dwTerminalTextSize</b> and <b>dwTerminalTextOffset</b>, in bytes.
     */
    dwTerminalTextEntrySize : UInt32

    /**
     * Size of the variably sized field containing descriptive text about each of the line's available terminals, including the <b>null</b> terminator, in bytes
     */
    dwTerminalTextSize : UInt32

    /**
     * Offset from the beginning of this structure to the descriptive text about each of the line's available terminals, in bytes. Each message is <b>dwTerminalTextEntrySize</b> bytes long. The string format of these textual descriptions is indicated by <b>dwStringFormat</b> in the line's device capabilities. The size of the field is specified by <b>dwTerminalTextSize</b>.
     */
    dwTerminalTextOffset : UInt32

    /**
     * Size of the variably sized device-specific field, in bytes. If the device-specific information is a pointer to a string, the size must include the <b>null</b> terminator.
     */
    dwDevSpecificSize : UInt32

    /**
     * Offset from the beginning of this structure to the device-specific field, in bytes. The size of the field is specified by <b>dwDevSpecificSize</b>.
     */
    dwDevSpecificOffset : UInt32

    /**
     * Features available for this line using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linefeature--constants">LINEFEATURE_ Constants</a>. Invoking a supported feature requires the line to be in the proper state and the underlying line device to be opened in a compatible mode. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the line is in the appropriate state for the operation to be meaningful. This member allows an application to discover which line features can be (and which can never be) supported by the device.
     */
    dwLineFeatures : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevstatusflags--constants">LINEDEVSTATUSFLAGS</a> values that can be modified using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetlinedevstatus">lineSetLineDevStatus</a>.
     */
    dwSettableDevStatus : UInt32

    /**
     * Size of a string containing the device class identifiers supported on one or more addresses on this line, including the <b>null</b> terminator, in bytes.
     */
    dwDeviceClassesSize : UInt32

    /**
     * Offset from the beginning of this structure to a string containing the device class identifiers supported on one or more addresses on this line, in bytes. These strings are for use with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a>; they are separated by <b>NULL</b>s, and the last identifier in the list is followed by two <b>NULL</b>s. The size of the field is specified by <b>dwDeviceClassesSize</b>.
     */
    dwDeviceClassesOffset : UInt32

    /**
     * GUID permanently associated with the line device.
     */
    PermanentLineGuid : Guid

}
