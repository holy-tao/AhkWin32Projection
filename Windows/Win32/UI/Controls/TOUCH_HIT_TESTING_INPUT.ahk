#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information about the touch contact area reported by the touch digitizer.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-touch_hit_testing_input
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TOUCH_HIT_TESTING_INPUT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The ID of the pointer. You cannot pass this value to the input message process and  retrieve additional pointer info through <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a>.
     * @type {Integer}
     */
    pointerId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The screen coordinates of the touch point that the touch digitizer reports.
     * @type {POINT}
     */
    point{
        get {
            if(!this.HasProp("__point"))
                this.__point := POINT(8, this)
            return this.__point
        }
    }

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
     * @type {RECT}
     */
    boundingBox{
        get {
            if(!this.HasProp("__boundingBox"))
                this.__boundingBox := RECT(16, this)
            return this.__boundingBox
        }
    }

    /**
     * The touch contact area within a specific targeted window that's not occluded by other objects that are higher in the z-order. Any area that's occluded by another object is an invalid target.
     * @type {RECT}
     */
    nonOccludedBoundingBox{
        get {
            if(!this.HasProp("__nonOccludedBoundingBox"))
                this.__nonOccludedBoundingBox := RECT(32, this)
            return this.__nonOccludedBoundingBox
        }
    }

    /**
     * The orientation of the touch contact area.
     * @type {Integer}
     */
    orientation {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
