#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The MCI_DGV_QUALITY_PARMSW (Unicode) structure (digitalv.h) contains parameters for the MCI_QUALITY command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The digitalv.h header defines MCI_DGV_QUALITY_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_quality_parmsw
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct MCI_DGV_QUALITY_PARMSW {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * One of the following constants indicating the type of algorithm:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCI_QUALITY_ITEM_AUDIO"></a><a id="mci_quality_item_audio"></a><dl>
     * <dt><b>MCI_QUALITY_ITEM_AUDIO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Definitions are for an audio compression algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCI_QUALITY_ITEM_STILL"></a><a id="mci_quality_item_still"></a><dl>
     * <dt><b>MCI_QUALITY_ITEM_STILL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Definitions are for a still video compression algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCI_QUALITY_ITEM_VIDEO"></a><a id="mci_quality_item_video"></a><dl>
     * <dt><b>MCI_QUALITY_ITEM_VIDEO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Definitions are for a video compression algorithm.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwItem : UInt32

    /**
     * String naming description.
     */
    lpstrName : PWSTR

    /**
     * String naming algorithm.
     */
    lpstrAlgorithm : UInt32

    /**
     * Handle to a structure containing information describing the quality attributes.
     */
    dwHandle : UInt32

}
