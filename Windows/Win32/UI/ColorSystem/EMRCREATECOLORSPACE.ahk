#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\LOGCOLORSPACEA.ahk" { LOGCOLORSPACEA }
#Import "..\..\Graphics\Gdi\CIEXYZTRIPLE.ahk" { CIEXYZTRIPLE }
#Import ".\LCSCSTYPE.ahk" { LCSCSTYPE }
#Import "..\..\Graphics\Gdi\CIEXYZ.ahk" { CIEXYZ }
#Import "..\..\Graphics\Gdi\EMR.ahk" { EMR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The EMRCREATECOLORSPACE structure contains members for the CreateColorSpace enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatecolorspace
 * @namespace Windows.Win32.UI.ColorSystem
 * @charset ANSI
 */
export default struct EMRCREATECOLORSPACE {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * The index of the color space in handle table.
     */
    ihCS : UInt32

    /**
     * The logical color space.
     */
    lcs : LOGCOLORSPACEA

}
