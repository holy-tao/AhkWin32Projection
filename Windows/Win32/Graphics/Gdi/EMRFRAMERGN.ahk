#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The EMRFRAMERGN structure contains members for the FrameRgn enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrframergn
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRFRAMERGN {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Bounding rectangle, in device units.
     */
    rclBounds : RECTL

    /**
     * Size of region data, in bytes.
     */
    cbRgnData : UInt32

    /**
     * Index of brush, in handle table.
     */
    ihBrush : UInt32

    /**
     * Width and height of region frame, in logical units.
     */
    szlStroke : SIZE

    /**
     * Buffer containing <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure.
     */
    RgnData : Int8[1]

}
