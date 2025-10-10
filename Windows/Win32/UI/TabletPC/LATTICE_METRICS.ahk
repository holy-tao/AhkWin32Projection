#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\LINE_SEGMENT.ahk

/**
 * Describes the baseline and the midline height.
 * @see https://docs.microsoft.com/windows/win32/api//rectypes/ns-rectypes-lattice_metrics
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class LATTICE_METRICS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-line_segment">LINE_SEGMENT</a> structure containing the start and end point of the baseline, in ink coordinates.
     * @type {LINE_SEGMENT}
     */
    lsBaseline{
        get {
            if(!this.HasProp("__lsBaseline"))
                this.__lsBaseline := LINE_SEGMENT(this.ptr + 0)
            return this.__lsBaseline
        }
    }

    /**
     * Offset of the midline, relative to the baseline, in HIMETRIC units.
     * @type {Integer}
     */
    iMidlineOffset {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }
}
