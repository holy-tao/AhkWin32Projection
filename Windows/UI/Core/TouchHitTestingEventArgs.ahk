#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITouchHitTestingEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the arguments returned by the [TouchHitTesting](icorewindow_touchhittesting.md) event.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.touchhittestingeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class TouchHitTestingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITouchHitTestingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITouchHitTestingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the proximity evaluation score for an object relative to the touch contact area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.touchhittestingeventargs.proximityevaluation
     * @type {CoreProximityEvaluation} 
     */
    ProximityEvaluation {
        get => this.get_ProximityEvaluation()
        set => this.put_ProximityEvaluation(value)
    }

    /**
     * Gets the screen coordinates of the touch point reported by the touch digitizer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.touchhittestingeventargs.point
     * @type {POINT} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * Gets the bounding rectangle of the touch contact area.
     * @remarks
     * The bounding rectangle is the area in which valid touch targets will be identified and ranked.
     * 
     * > [!NOTE]
     * > This bounding box may differ from the contact area reported by the digitizer when: + The digitizer reports a touch contact area that is outside the maximum or minimum size threshold recognized by [Touch Hit Testing](/previous-versions/windows/desktop/input_touchhittest/touch-hit-testing-portal).
     * + A portion of the touch contact area is occluded by another object higher in the z-order.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.touchhittestingeventargs.boundingbox
     * @type {RECT} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
    }

    /**
     * Gets or sets a value indicating whether the [TouchHitTesting](icorewindow_touchhittesting.md) event was handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.touchhittestingeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CoreProximityEvaluation} 
     */
    get_ProximityEvaluation() {
        if (!this.HasProp("__ITouchHitTestingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITouchHitTestingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchHitTestingEventArgs := ITouchHitTestingEventArgs(outPtr)
        }

        return this.__ITouchHitTestingEventArgs.get_ProximityEvaluation()
    }

    /**
     * 
     * @param {CoreProximityEvaluation} value 
     * @returns {HRESULT} 
     */
    put_ProximityEvaluation(value) {
        if (!this.HasProp("__ITouchHitTestingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITouchHitTestingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchHitTestingEventArgs := ITouchHitTestingEventArgs(outPtr)
        }

        return this.__ITouchHitTestingEventArgs.put_ProximityEvaluation(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point() {
        if (!this.HasProp("__ITouchHitTestingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITouchHitTestingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchHitTestingEventArgs := ITouchHitTestingEventArgs(outPtr)
        }

        return this.__ITouchHitTestingEventArgs.get_Point()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingBox() {
        if (!this.HasProp("__ITouchHitTestingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITouchHitTestingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchHitTestingEventArgs := ITouchHitTestingEventArgs(outPtr)
        }

        return this.__ITouchHitTestingEventArgs.get_BoundingBox()
    }

    /**
     * Returns a ranking for the polygon as the probable touch target and an adjusted touch point within the polygon. The rank is determined through a comparison of targeting heuristics for all polygons that intersect the touch contact area.
     * @param {RECT} controlBoundingBox 
     * @returns {CoreProximityEvaluation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.touchhittestingeventargs.evaluateproximity
     */
    EvaluateProximityToRect(controlBoundingBox) {
        if (!this.HasProp("__ITouchHitTestingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITouchHitTestingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchHitTestingEventArgs := ITouchHitTestingEventArgs(outPtr)
        }

        return this.__ITouchHitTestingEventArgs.EvaluateProximityToRect(controlBoundingBox)
    }

    /**
     * Returns a ranking for the polygon as the probable touch target and an adjusted touch point within the polygon. The rank is determined through a comparison of targeting heuristics for all polygons that intersect the touch contact area.
     * @param {Integer} controlVertices_length 
     * @param {Pointer<POINT>} controlVertices The array of x-y screen coordinates that define the shape of the UI element (the number of vertices in the polygon). This value must be greater than or equal to 3.
     * @returns {CoreProximityEvaluation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.touchhittestingeventargs.evaluateproximity
     */
    EvaluateProximityToPolygon(controlVertices_length, controlVertices) {
        if (!this.HasProp("__ITouchHitTestingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITouchHitTestingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchHitTestingEventArgs := ITouchHitTestingEventArgs(outPtr)
        }

        return this.__ITouchHitTestingEventArgs.EvaluateProximityToPolygon(controlVertices_length, controlVertices)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
