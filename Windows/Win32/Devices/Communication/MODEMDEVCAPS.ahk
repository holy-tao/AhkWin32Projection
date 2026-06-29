#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MODEMDEVCAPS_DIAL_OPTIONS.ahk" { MODEMDEVCAPS_DIAL_OPTIONS }
#Import ".\MODEMDEVCAPS_SPEAKER_VOLUME.ahk" { MODEMDEVCAPS_SPEAKER_VOLUME }
#Import ".\MODEMDEVCAPS_SPEAKER_MODE.ahk" { MODEMDEVCAPS_SPEAKER_MODE }

/**
 * Contains information about the capabilities of a modem.
 * @see https://learn.microsoft.com/windows/win32/api/mcx/ns-mcx-modemdevcaps
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct MODEMDEVCAPS {
    #StructPack 4

    /**
     * The size of the data actually returned to the application, in bytes. This member may be less than the <b>dwRequiredSize</b> member, if an application did not allocate enough space for the variable-length portion of the structure.
     */
    dwActualSize : UInt32

    /**
     * The number of bytes required for the entire 
     * <b>MODEMDEVCAPS</b> structure, including the variable-length portion.
     */
    dwRequiredSize : UInt32

    /**
     * The offset of the provider-defined portion of the structure, in bytes relative to the beginning of the structure.
     */
    dwDevSpecificOffset : UInt32

    /**
     * The size of the provider-defined portion of the structure, in bytes.
     */
    dwDevSpecificSize : UInt32

    /**
     * The version of the service provider. The format and use of this member depends on the service provider.
     */
    dwModemProviderVersion : UInt32

    /**
     * The offset of a text string that contains the name of the modem manufacturer, in bytes relative to the beginning of the structure.
     */
    dwModemManufacturerOffset : UInt32

    /**
     * The length of the modem manufacturer name, in bytes. The string is not null-terminated.
     */
    dwModemManufacturerSize : UInt32

    /**
     * The offset of a text string that contains the model of the modem, in bytes relative to the beginning of the structure.
     */
    dwModemModelOffset : UInt32

    /**
     * The length of the model name, in bytes. The string is not null-terminated.
     */
    dwModemModelSize : UInt32

    /**
     * The offset of a text string that gives the version and revision of the attached modem, if the provider could determine the information. The offset is specified in bytes relative to the beginning of the structure.
     */
    dwModemVersionOffset : UInt32

    /**
     * The length of the modem version string, in bytes. The string is not null-terminated.
     */
    dwModemVersionSize : UInt32

    dwDialOptions : MODEMDEVCAPS_DIAL_OPTIONS

    /**
     * The maximum call setup timeout supported by the modem, in seconds. This is the largest value that can be specified for the corresponding member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemsettings">MODEMSETTINGS</a> structure.
     */
    dwCallSetupFailTimer : UInt32

    /**
     * The maximum inactivity timeout supported by the modem, in tenths of seconds. This is the largest value that can be specified for the corresponding member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemsettings">MODEMSETTINGS</a> structure.
     */
    dwInactivityTimeout : UInt32

    dwSpeakerVolume : MODEMDEVCAPS_SPEAKER_VOLUME

    dwSpeakerMode : MODEMDEVCAPS_SPEAKER_MODE

    dwModemOptions : UInt32

    /**
     * The maximum DTE rate in bits per second.
     */
    dwMaxDTERate : UInt32

    /**
     * The maximum DCE rate in bits per second.
     */
    dwMaxDCERate : UInt32

    /**
     * Variable-length information, including strings and any provider-defined information.
     */
    abVariablePortion : Int8[1]

}
