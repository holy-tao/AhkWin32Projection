#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The MCI_DGV_RECORD_PARMS structure contains parameters for the MCI_RECORD command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_record_parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_DGV_RECORD_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Position to record from.
     */
    dwFrom : UInt32

    /**
     * Position to record to.
     */
    dwTo : UInt32

    /**
     * The region of the frame buffer used as the source for the pixels compressed and saved. <a href="https://docs.microsoft.com/previous-versions//ms536136(v=vs.85)">RECT</a> structures are handled differently in MCI than in other parts of Windows; in MCI, <b>rc.right</b> contains the width of the rectangle and <b>rc.bottom</b> contains its height.
     */
    rc : RECT

    /**
     * Audio stream.
     */
    dwAudioStream : UInt32

    /**
     * Video stream.
     */
    dwVideoStream : UInt32

}
