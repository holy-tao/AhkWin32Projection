#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI\_VD\_PLAY\_PARMS structure contains position and speed information for the MCI\_PLAY command for videodisc devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * 
 * You can use the [**MCI\_PLAY\_PARMS**](mci-play-parms.md) structure instead of **MCI\_VD\_PLAY\_PARMS** if you are not using the extended data members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-vd-play-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_VD_PLAY_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Position to play from.
     */
    dwFrom : UInt32

    /**
     * Position to play to.
     */
    dwTo : UInt32

    /**
     * Playback speed in frames per second.
     */
    dwSpeed : UInt32

}
