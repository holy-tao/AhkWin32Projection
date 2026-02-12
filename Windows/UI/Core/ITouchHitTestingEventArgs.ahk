#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreProximityEvaluation.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ITouchHitTestingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITouchHitTestingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{22f3b823-0b7c-424e-9df7-33d4f962931b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProximityEvaluation", "put_ProximityEvaluation", "get_Point", "get_BoundingBox", "EvaluateProximityToRect", "EvaluateProximityToPolygon"]

    /**
     * @type {CoreProximityEvaluation} 
     */
    ProximityEvaluation {
        get => this.get_ProximityEvaluation()
        set => this.put_ProximityEvaluation(value)
    }

    /**
     * @type {POINT} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * @type {RECT} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
    }

    /**
     * 
     * @returns {CoreProximityEvaluation} 
     */
    get_ProximityEvaluation() {
        value := CoreProximityEvaluation()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CoreProximityEvaluation} value 
     * @returns {HRESULT} 
     */
    put_ProximityEvaluation(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point() {
        value := POINT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingBox() {
        value := RECT()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Returns the score of a polygon as the probable touch target (compared to all other polygons that intersect the touch contact area) and an adjusted touch point within the polygon.
     * @remarks
     * For consistency with Windows, frameworks that handle <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-touchhittesting">WM_TOUCHHITTESTING</a> should use the following principles for targeting:
     * 
     * <ul>
     * <li>Inclusion: If the touch point is within the boundaries of a control, the touch point is not changed. 
     * </li>
     * <li>Intersection: Include only controls that intersect the contact geometry. 
     * </li>
     * <li>Z-order: If more than one control intersects the contact geometry, and the controls overlap, the control that's highest in the z-order receives priority. 
     * </li>
     * <li>Ambiguity: If more than one control intersects the contact geometry, and the controls don't overlap, the control that's closest to the original touch point receives priority. </li>
     * </ul>
     * @param {RECT} controlBoundingBox 
     * @returns {CoreProximityEvaluation} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-evaluateproximitytopolygon
     */
    EvaluateProximityToRect(controlBoundingBox) {
        proximityEvaluation := CoreProximityEvaluation()
        result := ComCall(10, this, "ptr", controlBoundingBox, "ptr", proximityEvaluation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return proximityEvaluation
    }

    /**
     * Returns the score of a polygon as the probable touch target (compared to all other polygons that intersect the touch contact area) and an adjusted touch point within the polygon.
     * @remarks
     * For consistency with Windows, frameworks that handle <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-touchhittesting">WM_TOUCHHITTESTING</a> should use the following principles for targeting:
     * 
     * <ul>
     * <li>Inclusion: If the touch point is within the boundaries of a control, the touch point is not changed. 
     * </li>
     * <li>Intersection: Include only controls that intersect the contact geometry. 
     * </li>
     * <li>Z-order: If more than one control intersects the contact geometry, and the controls overlap, the control that's highest in the z-order receives priority. 
     * </li>
     * <li>Ambiguity: If more than one control intersects the contact geometry, and the controls don't overlap, the control that's closest to the original touch point receives priority. </li>
     * </ul>
     * @param {Integer} controlVertices_length 
     * @param {Pointer<POINT>} controlVertices 
     * @returns {CoreProximityEvaluation} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-evaluateproximitytopolygon
     */
    EvaluateProximityToPolygon(controlVertices_length, controlVertices) {
        proximityEvaluation := CoreProximityEvaluation()
        result := ComCall(11, this, "uint", controlVertices_length, "ptr", controlVertices, "ptr", proximityEvaluation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return proximityEvaluation
    }
}
