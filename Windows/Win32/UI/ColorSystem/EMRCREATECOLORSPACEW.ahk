#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LOGCOLORSPACEW.ahk" { LOGCOLORSPACEW }
#Import ".\LCSCSTYPE.ahk" { LCSCSTYPE }
#Import "..\..\Graphics\Gdi\EMR.ahk" { EMR }
#Import "..\..\Graphics\Gdi\CIEXYZ.ahk" { CIEXYZ }
#Import "..\..\Graphics\Gdi\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import "..\..\Graphics\Gdi\CIEXYZTRIPLE.ahk" { CIEXYZTRIPLE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The EMRCREATECOLORSPACEW structure contains members for the CreateColorSpace enhanced metafile record. It differs from EMRCREATECOLORSPACE in that it has a Unicode logical color space and also has an optional array containing raw source profile data.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatecolorspacew
 * @namespace Windows.Win32.UI.ColorSystem
 * @charset Unicode
 */
export default struct EMRCREATECOLORSPACEW {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Index of the color space in handle table.
     */
    ihCS : UInt32

    /**
     * Logical color space. Note, this is the Unicode version of the structure.
     */
    lcs : LOGCOLORSPACEW

    /**
     * Can be the following.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>CREATECOLORSPACE_EMBEDED</td>
     * <td>Indicates that a color space is embedded in the metafile.</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Size of the raw source profile data in bytes, if it is attached.
     */
    cbData : UInt32

    /**
     * An array containing the source profile data. The size of the array is <b>cbData</b>.
     */
    Data : Int8[1]

}
