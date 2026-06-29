#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI_DGV_STEP_PARMS structure contains parameters for the MCI_STEP command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_step_parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_DGV_STEP_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Number of frames to step.
     */
    dwFrames : UInt32

}
