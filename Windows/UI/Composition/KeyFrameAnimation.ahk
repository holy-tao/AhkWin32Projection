#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionAnimation.ahk
#Include .\IKeyFrameAnimation.ahk
#Include .\IKeyFrameAnimation2.ahk
#Include .\IKeyFrameAnimation3.ahk
#Include .\IKeyFrameAnimationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A time-based animation with one or more key frames. These frames are markers, allowing developers to specify values at specific times for the animating property. KeyFrame animations can be further customized by specifying how the animation interpolates between keyframes.
 * @remarks
 * An animation is associated with an object's property by calling [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) and specifying the property name and the animation. See the remarks section of [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) for a list of animatable properties. See [Composition Animations Overview](/windows/uwp/composition/composition-animation) for additional information on [ExpressionAnimation](expressionanimation.md)s.
 * 
 * A KeyFrameAnimation does not stop automatically when an app's process is suspended. You must subscribe to app state events and stop or pause your animations before the app is suspended. For more info about app suspension, see [App lifecycle](/windows/uwp/launch-resume/app-lifecycle).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class KeyFrameAnimation extends CompositionAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyFrameAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyFrameAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Delay before the animation starts after [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) is called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.delaytime
     * @type {TimeSpan} 
     */
    DelayTime {
        get => this.get_DelayTime()
        set => this.put_DelayTime(value)
    }

    /**
     * The duration of the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * The iteration behavior for the key frame animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.iterationbehavior
     * @type {Integer} 
     */
    IterationBehavior {
        get => this.get_IterationBehavior()
        set => this.put_IterationBehavior(value)
    }

    /**
     * The number of times to repeat the key frame animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.iterationcount
     * @type {Integer} 
     */
    IterationCount {
        get => this.get_IterationCount()
        set => this.put_IterationCount(value)
    }

    /**
     * The number of key frames in the [KeyFrameAnimation](keyframeanimation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.keyframecount
     * @type {Integer} 
     */
    KeyFrameCount {
        get => this.get_KeyFrameCount()
    }

    /**
     * Specifies how to set the property value when [StopAnimation](compositionobject_stopanimation_1075337060.md) is called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.stopbehavior
     * @type {Integer} 
     */
    StopBehavior {
        get => this.get_StopBehavior()
        set => this.put_StopBehavior(value)
    }

    /**
     * The direction the animation is playing.
     * 
     * The 
     *     **Direction**
     *    property allows you to drive your animation from start to end or end to start or alternate between start and end or end to start if animation has an [IterationCount](keyframeanimation_iterationcount.md) greater than one. This gives an easy way for customizing animation definitions.
     * @remarks
     * Given an offset animation with an iteration count of 3 and two keyframes (0, and 1) with a value of Vector3(5,5,5) for keyframe 0 and a value of Vector3(20,20,20) for keyframe 1, the following table shows the animation behavior with different values for Direction.
     * 
     * <table>
     *    <tr><th>Direction</th><th>Animation Behavior</th></tr>
     *    <tr><td>Normal</td><td>Animation will start from offset value Vector3(5,5,5) and go to Vector3(20,20,20), repeating 3 times always starting from (5,5,5).</td></tr>
     *    <tr><td>Reverse</td><td>Animation will start in reverse and offset value (20,20,20) and goes to (5,5,5) repeating 3 times always starting from (20,20,20).</td></tr>
     *    <tr><td>Alternate</td><td>For the first iteration the animation will start from offset value (5,5,5) and go to (20,20,20). In the second iteration animation the animation will start from offset value (20,20,20) and go to (5,5,5). In third and final iteration the animation will start from offset (5,5,5) and go to (20,20,20).</td></tr>
     *    <tr><td>AlternateReverse</td><td>For the first iteration the animation will start from offset value (20,20,20) and go to (5,5,5). In the second iteration the animation will start from offset value (5,5,5) and go to (20, 20, 20). In the third and final iteration the animation will start from offset (20, 20, 20) and go to (5,5,5).</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.direction
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * The delay behavior of the key frame animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.delaybehavior
     * @type {Integer} 
     */
    DelayBehavior {
        get => this.get_DelayBehavior()
        set => this.put_DelayBehavior(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DelayTime() {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.get_DelayTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DelayTime(value) {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.put_DelayTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.put_Duration(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IterationBehavior() {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.get_IterationBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IterationBehavior(value) {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.put_IterationBehavior(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IterationCount() {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.get_IterationCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IterationCount(value) {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.put_IterationCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyFrameCount() {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.get_KeyFrameCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StopBehavior() {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.get_StopBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StopBehavior(value) {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.put_StopBehavior(value)
    }

    /**
     * Inserts an expression key frame.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {HSTRING} value The expression used to calculate the value of the key frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.insertexpressionkeyframe
     */
    InsertExpressionKeyFrame(normalizedProgressKey, value) {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.InsertExpressionKeyFrame(normalizedProgressKey, value)
    }

    /**
     * Inserts an expression keyframe.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {HSTRING} value The expression used to calculate the value of the key frame.
     * @param {CompositionEasingFunction} easingFunction The easing function to use when interpolating between frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.keyframeanimation.insertexpressionkeyframe
     */
    InsertExpressionKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        if (!this.HasProp("__IKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation := IKeyFrameAnimation(outPtr)
        }

        return this.__IKeyFrameAnimation.InsertExpressionKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        if (!this.HasProp("__IKeyFrameAnimation2")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation2 := IKeyFrameAnimation2(outPtr)
        }

        return this.__IKeyFrameAnimation2.get_Direction()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Direction(value) {
        if (!this.HasProp("__IKeyFrameAnimation2")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation2 := IKeyFrameAnimation2(outPtr)
        }

        return this.__IKeyFrameAnimation2.put_Direction(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DelayBehavior() {
        if (!this.HasProp("__IKeyFrameAnimation3")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation3 := IKeyFrameAnimation3(outPtr)
        }

        return this.__IKeyFrameAnimation3.get_DelayBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DelayBehavior(value) {
        if (!this.HasProp("__IKeyFrameAnimation3")) {
            if ((queryResult := this.QueryInterface(IKeyFrameAnimation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyFrameAnimation3 := IKeyFrameAnimation3(outPtr)
        }

        return this.__IKeyFrameAnimation3.put_DelayBehavior(value)
    }

;@endregion Instance Methods
}
