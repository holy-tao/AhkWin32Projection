#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\KeyFrameAnimation.ahk
#Include .\IVector2KeyFrameAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * A time-based animation that targets any Vector2-based property with one or more key frames.
 * @remarks
 * Use the [CompostionObject.StartAnimation](compositionobject_startanimation_709050842.md) and [CompostionObject.StopAnimation](compositionobject_stopanimation_1075337060.md) methods to start and stop the animation.
 * 
 * An animation is associated with an object's property by calling [CompostionObject.StartAnimation](compositionobject_startanimation_709050842.md) and specifying the property name and the animation. See the remarks section of [CompostionObject.StartAnimation](compositionobject_startanimation_709050842.md) for a list of animatable properties.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.vector2keyframeanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class Vector2KeyFrameAnimation extends KeyFrameAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVector2KeyFrameAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVector2KeyFrameAnimation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Inserts a key frame.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {Vector2} value The value of the key frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.vector2keyframeanimation.insertkeyframe
     */
    InsertKeyFrame(normalizedProgressKey, value) {
        if (!this.HasProp("__IVector2KeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IVector2KeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector2KeyFrameAnimation := IVector2KeyFrameAnimation(outPtr)
        }

        return this.__IVector2KeyFrameAnimation.InsertKeyFrame(normalizedProgressKey, value)
    }

    /**
     * Inserts a keyframe with the specified easing function.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {Vector2} value The value of the key frame.
     * @param {CompositionEasingFunction} easingFunction The easing function to use when interpolating between frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.vector2keyframeanimation.insertkeyframe
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        if (!this.HasProp("__IVector2KeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IVector2KeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector2KeyFrameAnimation := IVector2KeyFrameAnimation(outPtr)
        }

        return this.__IVector2KeyFrameAnimation.InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction)
    }

;@endregion Instance Methods
}
