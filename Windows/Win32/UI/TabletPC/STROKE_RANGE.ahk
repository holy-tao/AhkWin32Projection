#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of strokes in the InkDisp object.
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ns-tpcshrd-stroke_range
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct STROKE_RANGE {
    #StructPack 4

    /**
     * Index of the first stroke in the range, inclusive.
     */
    iStrokeBegin : UInt32

    /**
     * Index of the last stroke in the range, inclusive.
     */
    iStrokeEnd : UInt32

}
