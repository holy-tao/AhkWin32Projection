#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRCOLORMATCHTOTARGET structure contains members for the ColorMatchToTarget enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcolormatchtotarget
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRCOLORMATCHTOTARGET {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    dwAction : UInt32

    /**
     * This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>COLORMATCHTOTARGET_EMBEDED</td>
     * <td>Indicates that a color profile has been embedded in the metafile.</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * The size of the desired target profile name, in bytes.
     */
    cbName : UInt32

    /**
     * The size of the raw target profile data in bytes, if it is attached.
     */
    cbData : UInt32

    /**
     * An array containing the target profile name and the raw target profile data. 
     * 			 The size of the array is <b>cbName</b> + <b>cbData</b>. 
     * 			 If <b>cbData</b> is nonzero the raw target profile data is attached and follows the target profile name at location <b>Data</b>[<b>cbName</b>].
     */
    Data : Int8[1]

}
