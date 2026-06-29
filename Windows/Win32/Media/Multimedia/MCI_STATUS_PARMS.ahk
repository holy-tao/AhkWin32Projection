#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI\_STATUS\_PARMS structure contains information for the MCI\_STATUS command.
 * @remarks
 * The MCI\_STATUS\_ITEM flag must be set in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the **dwItem** member, which should contain one of the constants indicating what status information is being requested.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-status-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_STATUS_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Contains information on return.
     */
    dwReturn : IntPtr

    /**
     * Capability being queried.
     */
    dwItem : UInt32

    /**
     * Length or number of tracks.
     */
    dwTrack : UInt32

}
