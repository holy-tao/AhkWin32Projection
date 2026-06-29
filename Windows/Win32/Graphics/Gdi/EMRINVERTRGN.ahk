#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRINVERTRGN and EMRPAINTRGN structures contain members for the InvertRgn and PaintRgn enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrinvertrgn
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRINVERTRGN {
    #StructPack 4

    /**
     * Base structure for all record types.
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
     * Buffer containing an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure.
     */
    RgnData : Int8[1]

}
