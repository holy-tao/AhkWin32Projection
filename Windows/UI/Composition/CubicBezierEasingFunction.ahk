#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\ICubicBezierEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a cubic-bezier function for interpolating between animation key frames.
 * @remarks
 * The cubic-bezier function is one of the more common easing functions used with [KeyFrameAnimation](keyframeanimation.md)s and are used frequently to describe smooth curves that can be scaled. Cubic-bezier functions are defined by two "control points" of type Vector2 that define the shape of the curve. When used, the animating property will change in between two keyframes based on the defined curve.
 * 
 * There are numerous web services like [this one](https://go.microsoft.com/fwlink/?LinkId=809223) that allow you to visualize how the two control points affect the shape of the cubic-bezier. The values you define here are the same values that get input into each Vector2 component.
 * 
 * To create a new instance of `CubicBezierEasingFunction`, call [CompositionEasingFunction.CreateCubicBezierEasingFunction.md](compositioneasingfunction_createcubicbeziereasingfunction_1179886917.md) or [Compositor.CreateCubicBezierEasingFunction](compositor_createcubicbeziereasingfunction_804224215.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.cubicbeziereasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CubicBezierEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICubicBezierEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICubicBezierEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The first control point for the cubic-bezier interpolation function.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.cubicbeziereasingfunction.controlpoint1
     * @type {Vector2} 
     */
    ControlPoint1 {
        get => this.get_ControlPoint1()
    }

    /**
     * The second control point for the cubic-bezier interpolation function.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.cubicbeziereasingfunction.controlpoint2
     * @type {Vector2} 
     */
    ControlPoint2 {
        get => this.get_ControlPoint2()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_ControlPoint1() {
        if (!this.HasProp("__ICubicBezierEasingFunction")) {
            if ((queryResult := this.QueryInterface(ICubicBezierEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICubicBezierEasingFunction := ICubicBezierEasingFunction(outPtr)
        }

        return this.__ICubicBezierEasingFunction.get_ControlPoint1()
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_ControlPoint2() {
        if (!this.HasProp("__ICubicBezierEasingFunction")) {
            if ((queryResult := this.QueryInterface(ICubicBezierEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICubicBezierEasingFunction := ICubicBezierEasingFunction(outPtr)
        }

        return this.__ICubicBezierEasingFunction.get_ControlPoint2()
    }

;@endregion Instance Methods
}
