#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPropertyAnimation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides methods that enable you to retrieve the parameters for a translation (move to a new location) animation.
 * @remarks
 * To execute a translation animation, shift the item's position from its current location to its final location (the location of the object after the change in layout) according to the timing information provided through the methods of this interface.
 * 
 * The timing controls [Control1](translationanimation_control1.md) and [Control2](translationanimation_control2.md) specify the location of the first and second control points of a cubic Bézier curve. These two points have the same meaning as they do in the CSS **transition-timing-function** property. Control point zero is always (0,0) and control point three is always (1,1). The coordinates of [Control1](translationanimation_control1.md) and [Control2](translationanimation_control2.md) are always in the range 0 to 1, inclusive.
 * 
 * On the resulting Bézier curve, the x-coordinate represents time and the y-coordinate represents progress. The raw curve from (0,0) to (1,1) is scaled to match the actual duration and range of the animated transition, such that x=0 is the starting time of the transform, x=1 is the ending time, y=0 is the initial value of the animated property, and y=1 is the final value. Values of x and y between 0 and 1 represent corresponding intermediate values of time and the animation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.translationanimation
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class TranslationAnimation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPropertyAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPropertyAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of animation represented by this object.
     * @remarks
     * The [PropertyAnimation](propertyanimation.md) object can be cast to the derived object described by its type. See [PropertyAnimationType](propertyanimationtype.md) for a list of types and their corresponding objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.translationanimation.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the amount of time between when the translation animation is instructed to begin and when that animation actually begins to draw.
     * @remarks
     * This delay is in addition to any [StaggerDelay](animationdescription_staggerdelay.md) applied to the parent [AnimationDescription](animationdescription.md). For instance, if a transition is scheduled through the application of [StaggerDelay](animationdescription_staggerdelay.md) and [StaggerDelayFactor](animationdescription_staggerdelayfactor.md) to begin at time t=200 ms and this delay is set to 250 ms, then the transition will actually begin to animate at 450 ms.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.translationanimation.delay
     * @type {TimeSpan} 
     */
    Delay {
        get => this.get_Delay()
    }

    /**
     * Gets the amount of time over which the translation animation should be performed. This does not include the delay.
     * @remarks
     * The duration can be 0, in which case the object instantly jumps to its final position and no animation is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.translationanimation.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the location of the first control point for the cubic Bézier curve that describes how the translation should animate over time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.translationanimation.control1
     * @type {POINT} 
     */
    Control1 {
        get => this.get_Control1()
    }

    /**
     * Gets the location of the second control point for the cubic Bézier curve that describes how the translation should animate over time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.translationanimation.control2
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
