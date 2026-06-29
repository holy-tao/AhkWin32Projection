#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The MCI_DGV_SETAUDIO_PARMSW (Unicode) structure (digitalv.h) contains parameters for the MCI_SETAUDIO command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The digitalv.h header defines MCI_DGV_SETAUDIO_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_setaudio_parmsw
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct MCI_DGV_SETAUDIO_PARMSW {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Constant indicating the target adjustment. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mci-setaudio">MCI_SETAUDIO</a> command.
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
     * Pointer to a null-terminated string containing the name of the audio-compression algorithm.
     */
    lpstrAlgorithm : PWSTR

    /**
     * Pointer to a null-terminated string containing a descriptor of the audio-compression algorithm.
     */
    lpstrQuality : PWSTR

}
