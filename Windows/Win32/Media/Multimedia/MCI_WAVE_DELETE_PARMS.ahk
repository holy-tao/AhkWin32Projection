#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI\_WAVE\_DELETE\_PARMS structure contains position information for the MCI\_DELETE command for waveform-audio devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-wave-delete-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_WAVE_DELETE_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Position to delete from.
     */
    dwFrom : UInt32

    /**
     * Position to delete to.
     */
    dwTo : UInt32

}
