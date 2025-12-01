#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MSIPATCHSEQUENCEINFO structure is used by the MsiDeterminePatchSequence and MsiDetermineApplicablePatches functions. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The msi.h header defines MSIPATCHSEQUENCEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/msi/ns-msi-msipatchsequenceinfoa
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 * @charset ANSI
 */
class MSIPATCHSEQUENCEINFOA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to the path of a patch file, an XML blob, or an XML file.
     * @type {PSTR}
     */
    szPatchData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Qualifies <b>szPatchData</b> as a patch file, an XML blob, or an XML file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSIPATCH_DATATYPE_PATCHFILE"></a><a id="msipatch_datatype_patchfile"></a><dl>
     * <dt><b>MSIPATCH_DATATYPE_PATCHFILE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>szPatchData</b> member refers to a path of a patch file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSIPATCH_DATATYPE_XMLPATH"></a><a id="msipatch_datatype_xmlpath"></a><dl>
     * <dt><b>MSIPATCH_DATATYPE_XMLPATH</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>szPatchData</b> member refers to a path of a XML file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSIPATCH_DATATYPE_XMLBLOB"></a><a id="msipatch_datatype_xmlblob"></a><dl>
     * <dt><b>MSIPATCH_DATATYPE_XMLBLOB</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>szPatchData</b> member refers to an XML blob.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ePatchDataType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Set to an integer that indicates the sequence of the patch in the order of application. The sequence starts with 0. If a patch is not applicable to the specified .msi file, or if the function fails, <b>dwOrder</b> is set to -1.
     * @type {Integer}
     */
    dwOrder {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Set to ERROR_SUCCESS or the corresponding Win32 error code.
     * @type {Integer}
     */
    uStatus {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
