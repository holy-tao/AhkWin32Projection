#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about the touch contact area reported by the touch digitizer.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-touch_hit_testing_input
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TOUCH_HIT_TESTING_INPUT {
    #StructPack 4

    /**
     * The ID of the pointer. You cannot pass this value to the input message process and  retrieve additional pointer info through <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a>.
     */
    pointerId : UInt32

    /**
     * The screen coordinates of the touch point that the touch digitizer reports.
     */
    point : POINT

    /**
     * The bounding rectangle of the touch contact area. Valid touch targets are identified and scored based on this bounding box. 
     * 
     * <div class="alert"><b>Note</b>  This bounding box may differ from the contact area that the digitizer reports when:
     * <ul>
     * <li>The digitizer reports a touch contact area that's outside the maximum or minimum size threshold that's recognized by  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchhittest/touch-hit-testing-portal">Touch Hit Testing</a>.</li>
     * <li>A portion of the touch contact area is occluded by another object that's higher in the z-order.
     * </li>
     * </ul>
     * </div>
     * <div> </div>
     */
    boundingBox : RECT

    /**
     * The touch contact area within a specific targeted window that's not occluded by other objects that are higher in the z-order. Any area that's occluded by another object is an invalid target.
     */
    nonOccludedBoundingBox : RECT

    /**
     * The orientation of the touch contact area.
     */
    orientation : UInt32

}
