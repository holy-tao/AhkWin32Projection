#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI_DGV_SIGNAL_PARMS structure contains parameters for the MCI_SIGNAL command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_signal_parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_DGV_SIGNAL_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Position to be marked.
     */
    dwPosition : UInt32

    /**
     * Interval of the position marks.
     */
    dwPeriod : UInt32

    /**
     * User value associated with signals.
     */
    dwUserParm : UInt32

}
