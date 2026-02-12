#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkStrokeRenderingSegment.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A single segment of a complete ink stroke.
  * 
  * A single segment consists of a starting point, an ending point, and two Bezier control points. However, for a series of segments that make up a stroke, the last point of the previous segment is the first point of the current segment. This means that only the ending point for each segment is required to represent a complete stroke.
  * 
  * Each stroke is a vector of InkStrokeRenderingSegment objects with the first segment identified by a single starting point and all remaining segments identified by an ending point and two Bezier control points.
 * @remarks
 * Set the [FitToCurve](inkdrawingattributes_fittocurve.md) property of [DrawingAttributes](inkstroke_drawingattributes.md) to true if you want an ink stroke to be rendered with cubic Bezier curves. Otherwise, the stroke is rendered with straight line segments.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokerenderingsegment
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkStrokeRenderingSegment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkStrokeRenderingSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkStrokeRenderingSegment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the end point of the segment.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokerenderingsegment.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the first control point for the Bézier curve.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokerenderingsegment.beziercontrolpoint1
     * @type {POINT} 
     */
    BezierControlPoint1 {
        get => this.get_BezierControlPoint1()
    }

    /**
     * Gets the second control point for the Bézier curve.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokerenderingsegment.beziercontrolpoint2
     * @type {POINT} 
     */
    BezierControlPoint2 {
        get => this.get_BezierControlPoint2()
    }

    /**
     * Gets the pressure of the contact on the digitizer surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokerenderingsegment.pressure
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
    }

    /**
     * Gets the tilt of the contact along the x axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokerenderingsegment.tiltx
     * @type {Float} 
     */
    TiltX {
        get => this.get_TiltX()
    }

    /**
     * Gets the tilt of the contact along the y axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokerenderingsegment.tilty
     * @type {Float} 
     */
    TiltY {
        get => this.get_TiltY()
    }

    /**
     * Gets the twist of the contact along the rotational axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokerenderingsegment.twist
     * @type {Float} 
     */
    Twist {
        get => this.get_Twist()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IInkStrokeRenderingSegment")) {
            if ((queryResult := this.QueryInterface(IInkStrokeRenderingSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeRenderingSegment := IInkStrokeRenderingSegment(outPtr)
        }

        return this.__IInkStrokeRenderingSegment.get_Position()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_BezierControlPoint1() {
        if (!this.HasProp("__IInkStrokeRenderingSegment")) {
            if ((queryResult := this.QueryInterface(IInkStrokeRenderingSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeRenderingSegment := IInkStrokeRenderingSegment(outPtr)
        }

        return this.__IInkStrokeRenderingSegment.get_BezierControlPoint1()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_BezierControlPoint2() {
        if (!this.HasProp("__IInkStrokeRenderingSegment")) {
            if ((queryResult := this.QueryInterface(IInkStrokeRenderingSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeRenderingSegment := IInkStrokeRenderingSegment(outPtr)
        }

        return this.__IInkStrokeRenderingSegment.get_BezierControlPoint2()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pressure() {
        if (!this.HasProp("__IInkStrokeRenderingSegment")) {
            if ((queryResult := this.QueryInterface(IInkStrokeRenderingSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeRenderingSegment := IInkStrokeRenderingSegment(outPtr)
        }

        return this.__IInkStrokeRenderingSegment.get_Pressure()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TiltX() {
        if (!this.HasProp("__IInkStrokeRenderingSegment")) {
            if ((queryResult := this.QueryInterface(IInkStrokeRenderingSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeRenderingSegment := IInkStrokeRenderingSegment(outPtr)
        }

        return this.__IInkStrokeRenderingSegment.get_TiltX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TiltY() {
        if (!this.HasProp("__IInkStrokeRenderingSegment")) {
            if ((queryResult := this.QueryInterface(IInkStrokeRenderingSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeRenderingSegment := IInkStrokeRenderingSegment(outPtr)
        }

        return this.__IInkStrokeRenderingSegment.get_TiltY()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Twist() {
        if (!this.HasProp("__IInkStrokeRenderingSegment")) {
            if ((queryResult := this.QueryInterface(IInkStrokeRenderingSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeRenderingSegment := IInkStrokeRenderingSegment(outPtr)
        }

        return this.__IInkStrokeRenderingSegment.get_Twist()
    }

;@endregion Instance Methods
}
