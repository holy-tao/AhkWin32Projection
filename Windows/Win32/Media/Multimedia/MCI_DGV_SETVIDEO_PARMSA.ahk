#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The MCI_DGV_SETVIDEO_PARMSA (ANSI) structure contains parameters for the MCI_SETVIDEO command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The digitalv.h header defines MCI_DGV_SETVIDEO_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_setvideo_parmsa
 * @namespace Windows.Win32.Media.Multimedia
 * @charset ANSI
 */
export default struct MCI_DGV_SETVIDEO_PARMSA {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Constant indicating the target adjustment.
     */
    dwItem : UInt32

    /**
     * Adjustment level.
     */
    dwValue : UInt32

    /**
     * Transmission length.
     */
    dwOver : UInt32

    /**
     * Pointer to a null-terminated string containing the name of the video-compression algorithm.
     */
    lpstrAlgorithm : PSTR

    /**
     * Pointer to a null-terminated string containing a descriptor of the video-compression algorithm.
     */
    lpstrQuality : PSTR

    /**
     * Index of input source.
     */
    dwSourceNumber : UInt32

}
