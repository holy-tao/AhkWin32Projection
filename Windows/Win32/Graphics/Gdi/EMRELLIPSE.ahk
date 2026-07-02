#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * The EMRELLIPSE and EMRRECTANGLE structures contain members for the Ellipse and Rectangle enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrellipse
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRELLIPSE {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Bounding rectangle in logical units.
     */
    rclBox : RECTL

}
