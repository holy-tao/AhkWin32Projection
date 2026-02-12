#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Describes properties of animations that are common to all animation effects.
 * @remarks
 * Do not implement this interface. Obtain a pointer to an instance of this interface by using the [AnimationDescription.Animations](animationdescription_animations.md) property.
 * 
 * The timing controls [Control1](ipropertyanimation_control1.md) and [Control2](ipropertyanimation_control2.md) specify the location of the first and second control points of a cubic Bézier curve. These two points have the same meaning as they do in the CSS **transition-timing-function** property. Control point zero is always (0,0) and control point three is always (1,1). The coordinates of [Control1](ipropertyanimation_control1.md) and [Control2](ipropertyanimation_control2.md) are always in the range 0 to 1, inclusive.
 * 
 * On the resulting Bézier curve, the x-coordinate represents time and the y-coordinate represents progress. The raw curve from (0,0) to (1,1) is scaled to match the actual duration and range of the animated transition, such that x=0 is the starting time of the transform, x=1 is the ending time, y=0 is the initial value of the animated property, and y=1 is the final value. Values of x and y between 0 and 1 represent corresponding intermediate values of time and the animation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.ipropertyanimation
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class IPropertyAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyAnimation
     * @type {Guid}
     */
    static IID => Guid("{3a01b4da-4d8c-411e-b615-1ade683a9903}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Delay", "get_Duration", "get_Control1", "get_Control2"]

    /**
     * Gets the type of animation represented by this object.
     * @remarks
     * The [IPropertyAnimation](ipropertyanimation.md) object can be cast to the derived object described by its type. See [PropertyAnimationType](propertyanimationtype.md) for a list of types and their corresponding objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.ipropertyanimation.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the amount of time between when the animation is instructed to begin and when that animation actually begins to draw.
     * @remarks
     * This delay is in addition to any [StaggerDelay](animationdescription_staggerdelay.md) applied to the parent [AnimationDescription](animationdescription.md). For instance, if a transition is scheduled through the application of [StaggerDelay](animationdescription_staggerdelay.md) and [StaggerDelayFactor](animationdescription_staggerdelayfactor.md) to begin at time t=200 ms and this delay is set to 250 ms, then the transition will actually begin to animate at 450 ms.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.ipropertyanimation.delay
     * @type {TimeSpan} 
     */
    Delay {
        get => this.get_Delay()
    }

    /**
     * Gets the amount of time over which the animation should be performed. This does not include the delay.
     * @remarks
     * The duration can be 0, in which case all animated properties are instantly set to their final values and no animation is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.ipropertyanimation.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the location of the first control point for the cubic Bézier curve that describes how this property of this object should animate over time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.ipropertyanimation.control1
     * @type {POINT} 
     */
    Control1 {
        get => this.get_Control1()
    }

    /**
     * Gets the location of the second control point for the cubic Bézier curve that describes how this property of this object should animate over time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.ipropertyanimation.control2
     * @type {POINT} 
     */
    Control2 {
        get => this.get_Control2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Delay() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Control1() {
        value := POINT()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Control2() {
        value := POINT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
