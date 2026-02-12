#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScaleAnimation.ahk
#Include .\IPropertyAnimation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides methods that enable you to retrieve the parameters for a scaling (growing or shrinking) animation.
 * @remarks
 * The scale is a factor that is applied to the object in either the x- or y- direction. A scale value of 1.0 represents no scaling, less than 1 represents shrinking, and greater than 1 represents magnification.
 * 
 * The origin point of a scale represents the center point around which the scaling should take place. This point remains fixed throughout the animation; it does not animate. The origin is stated as a fraction of the object's size. For example, a [NormalizedOrigin](scaleanimation_normalizedorigin.md).X of 0.25 represents a point 25% of the way from the left edge to the right edge of the object. If the object is 100 pixels wide, then a [NormalizedOrigin](scaleanimation_normalizedorigin.md).X represents a point 25 pixels from the left edge of the object.
 * 
 * 
 * 
 * > [!NOTE]
 * > The sense of left and right are flipped on right-to-left (RTL) systems.
 * 
 * As an example, consider an object whose coordinate rectangle is (100, 150, 200, 300), expressed in (left, top, right, bottom) format. Suppose that the interpolated x-scale is 0.4, the interpolated y-scale is 2.0, the x-origin is 0.25, and the y-origin is 0.80.
 * 
 * First, convert the normalized origin values to pixels. The width of the object is 100 pixels and the x-origin is given as 0.25, which results in an x-origin of 25 pixels from the left of the object. Since the object's left coordinate is 100, the x-coordinate of the origin is 125.
 * 
 * Similarly, the height of the object is 150 pixels and the y-origin is 0.80, which results in a y-origin of 120 pixels from the top of the object. Since the object's top coordinate is 150, the y-coordinate of the origin is 245.
 * 
 * To apply the scale transform, we first translate the object by the negative of the origin, moving it to (-25, -95, 75, 55). Next, we multiply the left and right coordinates by the x-scale and the top and bottom coordinates by the y-scale, which results in (-10, -190, 30, 110). Finally, we translate the object by the origin, which results in (115, 55, 155, 300).
 * 
 * The [InitialScaleX](scaleanimation_initialscalex.md) and [InitialScaleY](scaleanimation_initialscaley.md) properties are guaranteed to be either both set or both not set. If they are not set, then the current object scale should be used as the initial value of the animation.
 * 
 * The timing controls [Control1](scaleanimation_control1.md) and [Control2](scaleanimation_control2.md) specify the location of the first and second control points of a cubic Bézier curve. These two points have the same meaning as they do in the CSS **transition-timing-function** property. Control point zero is always (0,0) and control point three is always (1,1). The coordinates of [Control1](scaleanimation_control1.md) and [Control2](scaleanimation_control2.md) are always in the range 0 to 1, inclusive.
 * 
 * On the resulting Bézier curve, the x-coordinate represents time and the y-coordinate represents progress. The raw curve from (0,0) to (1,1) is scaled to match the actual duration and range of the animated transition, such that x=0 is the starting time of the transform, x=1 is the ending time, y=0 is the initial value of the animated property, and y=1 is the final value. Values of x and y between 0 and 1 represent corresponding intermediate values of time and the animation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class ScaleAnimation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScaleAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScaleAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the initial horizontal scale factor for the object.
     * @remarks
     * This property's value might not be set when this method is called. In that case, the object's current horizontal scale should be used as the starting point for the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.initialscalex
     * @type {IReference<Float>} 
     */
    InitialScaleX {
        get => this.get_InitialScaleX()
    }

    /**
     * Gets the initial vertical scale factor for the object.
     * @remarks
     * This property's value might not be set when this method is called. In that case, the object's current horizontal scale should be used as the starting point for the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.initialscaley
     * @type {IReference<Float>} 
     */
    InitialScaleY {
        get => this.get_InitialScaleY()
    }

    /**
     * Gets the final horizontal scale factor for the object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.finalscalex
     * @type {Float} 
     */
    FinalScaleX {
        get => this.get_FinalScaleX()
    }

    /**
     * Gets the final vertical scale factor for the object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.finalscaley
     * @type {Float} 
     */
    FinalScaleY {
        get => this.get_FinalScaleY()
    }

    /**
     * Gets the center point for the scaling animation, expressed as a point relative to the object's normal size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.normalizedorigin
     * @type {POINT} 
     */
    NormalizedOrigin {
        get => this.get_NormalizedOrigin()
    }

    /**
     * Gets the type of animation represented by this object.
     * @remarks
     * The [PropertyAnimation](propertyanimation.md) object can be cast to the derived object described by its type. See [PropertyAnimationType](propertyanimationtype.md) for a list of types and their corresponding objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the amount of time between when the scale animation is instructed to begin and when that animation actually begins to draw.
     * @remarks
     * This delay is in addition to any [StaggerDelay](animationdescription_staggerdelay.md) applied to the parent [AnimationDescription](animationdescription.md). For instance, if a transition is scheduled through the application of [StaggerDelay](animationdescription_staggerdelay.md) and [StaggerDelayFactor](animationdescription_staggerdelayfactor.md) to begin at time t=200 ms and this delay is set to 250 ms, then the transition will actually begin to animate at 450 ms.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.delay
     * @type {TimeSpan} 
     */
    Delay {
        get => this.get_Delay()
    }

    /**
     * Gets the amount of time over which the scale animation should be performed. This does not include the delay.
     * @remarks
     * The duration can be 0, in which case the object instantly jumps to its final size and no animation is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the location of the first control point for the cubic Bézier curve that describes how the scale should animate over time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.control1
     * @type {POINT} 
     */
    Control1 {
        get => this.get_Control1()
    }

    /**
     * Gets the location of the second control point for the cubic Bézier curve that describes how the scale should animate over time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.scaleanimation.control2
     * @type {POINT} 
     */
    Control2 {
        get => this.get_Control2()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_InitialScaleX() {
        if (!this.HasProp("__IScaleAnimation")) {
            if ((queryResult := this.QueryInterface(IScaleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleAnimation := IScaleAnimation(outPtr)
        }

        return this.__IScaleAnimation.get_InitialScaleX()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_InitialScaleY() {
        if (!this.HasProp("__IScaleAnimation")) {
            if ((queryResult := this.QueryInterface(IScaleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleAnimation := IScaleAnimation(outPtr)
        }

        return this.__IScaleAnimation.get_InitialScaleY()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FinalScaleX() {
        if (!this.HasProp("__IScaleAnimation")) {
            if ((queryResult := this.QueryInterface(IScaleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleAnimation := IScaleAnimation(outPtr)
        }

        return this.__IScaleAnimation.get_FinalScaleX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FinalScaleY() {
        if (!this.HasProp("__IScaleAnimation")) {
            if ((queryResult := this.QueryInterface(IScaleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleAnimation := IScaleAnimation(outPtr)
        }

        return this.__IScaleAnimation.get_FinalScaleY()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_NormalizedOrigin() {
        if (!this.HasProp("__IScaleAnimation")) {
            if ((queryResult := this.QueryInterface(IScaleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleAnimation := IScaleAnimation(outPtr)
        }

        return this.__IScaleAnimation.get_NormalizedOrigin()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IPropertyAnimation")) {
            if ((queryResult := this.QueryInterface(IPropertyAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyAnimation := IPropertyAnimation(outPtr)
        }

        return this.__IPropertyAnimation.get_Type()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Delay() {
        if (!this.HasProp("__IPropertyAnimation")) {
            if ((queryResult := this.QueryInterface(IPropertyAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyAnimation := IPropertyAnimation(outPtr)
        }

        return this.__IPropertyAnimation.get_Delay()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IPropertyAnimation")) {
            if ((queryResult := this.QueryInterface(IPropertyAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyAnimation := IPropertyAnimation(outPtr)
        }

        return this.__IPropertyAnimation.get_Duration()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Control1() {
        if (!this.HasProp("__IPropertyAnimation")) {
            if ((queryResult := this.QueryInterface(IPropertyAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyAnimation := IPropertyAnimation(outPtr)
        }

        return this.__IPropertyAnimation.get_Control1()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Control2() {
        if (!this.HasProp("__IPropertyAnimation")) {
            if ((queryResult := this.QueryInterface(IPropertyAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyAnimation := IPropertyAnimation(outPtr)
        }

        return this.__IPropertyAnimation.get_Control2()
    }

;@endregion Instance Methods
}
