#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * The EMRROUNDRECT structure contains members for the RoundRect enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrroundrect
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRROUNDRECT {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Bounding rectangle, in logical units.
     */
    rclBox : RECTL

    /**
     * Width and height, in logical units, of the ellipse used to draw rounded corners.
     */
    szlCorner : SIZE

}
