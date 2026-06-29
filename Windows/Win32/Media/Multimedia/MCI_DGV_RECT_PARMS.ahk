#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The MCI_DGV_RECT_PARMS structure contains parameters for the MCI_FREEZE, MCI_PUT, MCI_UNFREEZE, and MCI_WHERE commands for digital-video devices.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/digitalv/ns-digitalv-mci_dgv_rect_parms">MCI_DGV_FREEZE_PARMS</a>, <a href="https://docs.microsoft.com/previous-versions/dd743397(v=vs.85)">MCI_DGV_PUT_PARMS</a>, <b>MCI_DGV_UNFREEZE_PARMS</b> and <b>MCI_DGV_WHERE_PARMS</b> structures are identical to the <b>MCI_DGV_RECT_PARMS</b> structure.
 * 
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_rect_parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_DGV_RECT_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Rectangle containing positioning information. <a href="https://docs.microsoft.com/previous-versions//ms536136(v=vs.85)">RECT</a> structures are handled differently in MCI than in other parts of Windows; in MCI, <b>rc.right</b> contains the width of the rectangle and <b>rc.bottom</b> contains its height.
     */
    rc : RECT

}
