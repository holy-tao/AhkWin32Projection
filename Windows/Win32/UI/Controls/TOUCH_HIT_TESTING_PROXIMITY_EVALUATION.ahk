#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains the hit test score that indicates whether the object is the likely target of the touch contact area, relative to other objects that intersect the touch contact area.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-evaluateproximitytorect">EvaluateProximityToRect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-evaluateproximitytopolygon">EvaluateProximityToPolygon</a> function returns the values.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-touch_hit_testing_proximity_evaluation
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TOUCH_HIT_TESTING_PROXIMITY_EVALUATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The score, compared to the other objects that intersect the touch contact area.
     * @type {Integer}
     */
    score {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The adjusted touch point that hits the closest object that's identified by the value of <i>Score</i>.
     * @type {POINT}
     */
    adjustedPoint{
        get {
            if(!this.HasProp("__adjustedPoint"))
                this.__adjustedPoint := POINT(this.ptr + 8)
            return this.__adjustedPoint
        }
    }
}
