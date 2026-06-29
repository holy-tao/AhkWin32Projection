#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI\_SET\_PARMS structure contains information for the MCI\_SET command.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-set-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_SET_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Time format for device.
     */
    dwTimeFormat : UInt32

    /**
     * Audio output channel.
     */
    dwAudio : UInt32

}
