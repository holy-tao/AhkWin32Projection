#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The MCI_DGV_COPY_PARMS structure contains parameters for the MCI_COPY command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_copy_parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_DGV_COPY_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Starting position for copy.
     */
    dwFrom : UInt32

    /**
     * Ending position for copy.
     */
    dwTo : UInt32

    /**
     * Rectangle describing area to be copied.   Be aware that <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures are handled differently in MCI than in other parts of Windows; in MCI, <b>rc.right</b> contains the width of the rectangle and <b>rc.bottom</b> contains its height.
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
