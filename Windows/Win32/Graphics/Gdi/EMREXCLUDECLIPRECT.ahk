#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * The EMREXCLUDECLIPRECT and EMRINTERSECTCLIPRECT structures contain members for the ExcludeClipRect and IntersectClipRect enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrexcludecliprect
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMREXCLUDECLIPRECT {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Clipping rectangle in logical units.
     */
    rclClip : RECTL

}
