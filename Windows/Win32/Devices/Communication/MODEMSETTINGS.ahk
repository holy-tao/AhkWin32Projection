#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MODEMSETTINGS_SPEAKER_MODE.ahk" { MODEMSETTINGS_SPEAKER_MODE }
#Import ".\MODEM_SPEAKER_VOLUME.ahk" { MODEM_SPEAKER_VOLUME }

/**
 * Contains information about a modem's configuration.
 * @see https://learn.microsoft.com/windows/win32/api/mcx/ns-mcx-modemsettings
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct MODEMSETTINGS {
    #StructPack 4

    /**
     * The size of the data actually returned to the application, in bytes. This member may be less than the <b>dwRequiredSize</b> member if an application did not allocate enough space for the variable-length portion of the structure.
     */
    dwActualSize : UInt32

    /**
     * The number of bytes required for the entire 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemdevcaps">MODEMDEVCAPS</a> structure, including the variable-length portion.
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
     * The maximum number of seconds the modem should wait, after dialing is completed, for an indication that a modem-to-modem connection has been established. If a connection is not established in this interval, the call is assumed to have failed. This member is equivalent to register S7 in Hayes® compatible modems.
     */
    dwCallSetupFailTimer : UInt32

    /**
     * The maximum number of seconds of inactivity allowed after a connection is established. If no data is either transmitted or received for this period of time, the call is automatically terminated. This time-out is used to avoid excessive long-distance charges or online service charges if an application unexpectedly locks up or the user leaves.
     */
    dwInactivityTimeout : UInt32

    dwSpeakerVolume : MODEM_SPEAKER_VOLUME

    dwSpeakerMode : MODEMSETTINGS_SPEAKER_MODE

    /**
     * The modem options requested by the application. The local and remote modems negotiate modem options during call setup; this member specifies the initial negotiating position of the local modem. 
     * 
     * 
     * 
     * 
     * The <b>dwModemOptions</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemdevcaps">MODEMDEVCAPS</a> structure specifies the modem options supported by the local modem. For a list of modem options, see the description of the 
     * <b>MODEMDEVCAPS</b> structure.
     */
    dwPreferredModemOptions : UInt32

    /**
     * The modem options that are actually in effect. This member is filled in after a connection is established and the local and remote modems negotiate modem options. 
     * 
     * 
     * 
     * 
     * The <b>dwModemOptions</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemdevcaps">MODEMDEVCAPS</a> structure specifies the modem options supported by the local modem. For a list of modem options, see the description of the 
     * <b>MODEMDEVCAPS</b> structure.
     */
    dwNegotiatedModemOptions : UInt32

    /**
     * The DCE rate in effect. This member is filled in after a connection is established and the local and remote modems negotiate modem modulations.
     */
    dwNegotiatedDCERate : UInt32

    /**
     * Optional provider-defined information.
     */
    abVariablePortion : Int8[1]

}
