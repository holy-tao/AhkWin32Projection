#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * The EMRFILLPATH,�EMRSTROKEANDFILLPATH,� and EMRSTROKEPATH structures contain members for the FillPath, StrokeAndFillPath, and StrokePath enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrfillpath
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRFILLPATH {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Bounding rectangle, in device units.
     */
    rclBounds : RECTL

}
