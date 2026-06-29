#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * Contains the hit test score that indicates whether the object is the likely target of the touch contact area, relative to other objects that intersect the touch contact area.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-evaluateproximitytorect">EvaluateProximityToRect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-evaluateproximitytopolygon">EvaluateProximityToPolygon</a> function returns the values.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-touch_hit_testing_proximity_evaluation
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TOUCH_HIT_TESTING_PROXIMITY_EVALUATION {
    #StructPack 4

    /**
     * The score, compared to the other objects that intersect the touch contact area.
     */
    score : UInt16

    /**
     * The adjusted touch point that hits the closest object that's identified by the value of <i>Score</i>.
     */
    adjustedPoint : POINT

}
