#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The MCI\_OVLY\_RECT\_PARMS structure contains positioning information for the MCI\_PUT and MCI\_WHERE commands for video-overlay devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-ovly-rect-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_OVLY_RECT_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Rectangle containing positioning information. [RECT](/previous-versions//ms536136(v=vs.85)) structures are handled differently in MCI than in other parts of Windows; in MCI, **rc.right** contains the width of the rectangle and **rc.bottom** contains its height.
     */
    rc : RECT

}
