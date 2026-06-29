#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LINE_SEGMENT.ahk" { LINE_SEGMENT }
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * Describes the baseline and the midline height.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-lattice_metrics
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct LATTICE_METRICS {
    #StructPack 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-line_segment">LINE_SEGMENT</a> structure containing the start and end point of the baseline, in ink coordinates.
     */
    lsBaseline : LINE_SEGMENT

    /**
     * Offset of the midline, relative to the baseline, in HIMETRIC units.
     */
    iMidlineOffset : Int16

}
