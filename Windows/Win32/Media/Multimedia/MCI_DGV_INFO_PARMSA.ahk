#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The MCI_DGV_INFO_PARMSA (ANSI) structure (digitalv.h) contains parameters for the MCI_INFO command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The digitalv.h header defines MCI_DGV_INFO_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_info_parmsa
 * @namespace Windows.Win32.Media.Multimedia
 * @charset ANSI
 */
export default struct MCI_DGV_INFO_PARMSA {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Pointer to buffer for return string.
     */
    lpstrReturn : PSTR

    /**
     * Size, in bytes, of return buffer.
     */
    dwRetSize : UInt32

    /**
     * Constant describing information to return.
     */
    dwItem : UInt32

}
