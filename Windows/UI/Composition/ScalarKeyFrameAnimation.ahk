#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\KeyFrameAnimation.ahk
#Include .\IScalarKeyFrameAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * A time-based animation that targets any Scalar-based property with one or more key frames.
 * @remarks
 * An animation is associated with an object's property by calling [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) and specifying the property name and the animation. See the remarks section of [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) for a list of animatable properties.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scalarkeyframeanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ScalarKeyFrameAnimation extends KeyFrameAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScalarKeyFrameAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScalarKeyFrameAnimation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Inserts a key frame.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {Float} value The value of the key frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scalarkeyframeanimation.insertkeyframe
     */
    InsertKeyFrame(normalizedProgressKey, value) {
        if (!this.HasProp("__IScalarKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IScalarKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarKeyFrameAnimation := IScalarKeyFrameAnimation(outPtr)
        }

        return this.__IScalarKeyFrameAnimation.InsertKeyFrame(normalizedProgressKey, value)
    }

    /**
     * Inserts a keyframe.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {Float} value The value of the key frame.
     * @param {CompositionEasingFunction} easingFunction The easing function to use to interpolate between key frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scalarkeyframeanimation.insertkeyframe
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        if (!this.HasProp("__IScalarKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IScalarKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarKeyFrameAnimation := IScalarKeyFrameAnimation(outPtr)
        }

        return this.__IScalarKeyFrameAnimation.InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction)
    }

;@endregion Instance Methods
}
