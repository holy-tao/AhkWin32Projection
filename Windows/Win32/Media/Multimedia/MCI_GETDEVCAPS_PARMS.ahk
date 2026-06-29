#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI\_GETDEVCAPS\_PARMS structure contains device-capability information for the MCI\_GETDEVCAPS command.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-getdevcaps-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_GETDEVCAPS_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Contains information on exit.
     */
    dwReturn : UInt32

    /**
     * Capability being queried. This member can be one of the constants listed in the reference material for the [**MCI\_GETDEVCAPS**](mci-getdevcaps.md) command.
     */
    dwItem : UInt32

}
