#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI\_GENERIC\_PARMS structure contains the handle of the window that receives notification messages. This structure is used for MCI command messages that have empty parameter lists.
 * @remarks
 * The **MCI\_CLOSE\_PARMS** and **MCI\_REALIZE\_PARMS** structures are identical to the **MCI\_GENERIC\_PARMS** structure.
 * 
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-generic-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_GENERIC_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

}
