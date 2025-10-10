#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Describes the start and end points of a line recognition segment, such as the baseline or midline.
 * @see https://docs.microsoft.com/windows/win32/api//rectypes/ns-rectypes-line_segment
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class LINE_SEGMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Point that represents the start of the line segment. The point is in ink space coordinates.
     * @type {POINT}
     */
    PtA{
        get {
            if(!this.HasProp("__PtA"))
                this.__PtA := POINT(this.ptr + 0)
            return this.__PtA
        }
    }

    /**
     * Point that represents the end of the line segment. The point is in ink space coordinates.
     * @type {POINT}
     */
    PtB{
        get {
            if(!this.HasProp("__PtB"))
                this.__PtB := POINT(this.ptr + 8)
            return this.__PtB
        }
    }
}
