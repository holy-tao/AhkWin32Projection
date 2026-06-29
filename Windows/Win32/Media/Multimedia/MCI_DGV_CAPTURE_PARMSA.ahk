#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The MCI_DGV_CAPTURE_PARMSA (ANSI) structure (digitalv.h) contains parameters for the MCI_CAPTURE command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <b>mciSendCommand</b> function to validate the members.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The digitalv.h header defines MCI_DGV_CAPTURE_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_capture_parmsa
 * @namespace Windows.Win32.Media.Multimedia
 * @charset ANSI
 */
export default struct MCI_DGV_CAPTURE_PARMSA {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Pointer to a null-terminated string specifying the destination path and filename for the file that receives the captured data.
     */
    lpstrFileName : PSTR

    /**
     * Rectangle containing positioning information. <a href="https://docs.microsoft.com/previous-versions//ms536136(v=vs.85)">RECT</a> structures are handled differently in MCI than in other parts of Windows; in MCI, <b>rc.right</b> contains the width of the rectangle and <b>rc.bottom</b> contains its height.
     */
    rc : RECT

}
