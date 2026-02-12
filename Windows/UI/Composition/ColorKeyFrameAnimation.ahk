#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\KeyFrameAnimation.ahk
#Include .\IColorKeyFrameAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * A time-based animation that targets the Color property with one or more color key frames.
  * 
  * The ColorKeyFrameAnimation class is one of the supported types of [KeyFrameAnimation](keyframeanimation.md)s that is used to animate the [Color](compositioncolorbrush_color.md) property off of the [Brush](spritevisual_brush.md) property on a [SpriteVisual](spritevisual.md). When working with ColorKeyFrameAnimation s, utilize Windows.UI.Color objects for the values of keyframes. Utilize the InterpolationColorSpace property to define which color space the system will interpolate through for the animation.
 * @remarks
 * Use the [CompostionObject.StartAnimation](compositionobject_startanimation_709050842.md) and [CompostionObject.StopAnimation](compositionobject_stopanimation_1075337060.md) methods to start and stop the animation.
 * 
 * An animation is associated with an object's property by calling [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) and specifying the property name and the animation. See the remarks section of [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) for a list of animatable properties.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.colorkeyframeanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ColorKeyFrameAnimation extends KeyFrameAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorKeyFrameAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorKeyFrameAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The color space the color interpolation should run through.
     * 
     * The 
     *     **ColorKeyFrameAnimation.InterpolationColorSpace**
     *    property enables a developer to choose what color space the system will interpolate through when animating between two colors. Developers can choose between the [CompositionColorSpace](compositioncolorspace.md) enum values Rgb, Hsl, or Auto (system chosen).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.colorkeyframeanimation.interpolationcolorspace
     * @type {Integer} 
     */
    InterpolationColorSpace {
        get => this.get_InterpolationColorSpace()
        set => this.put_InterpolationColorSpace(value)
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
    get_InterpolationColorSpace() {
        if (!this.HasProp("__IColorKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IColorKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorKeyFrameAnimation := IColorKeyFrameAnimation(outPtr)
        }

        return this.__IColorKeyFrameAnimation.get_InterpolationColorSpace()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InterpolationColorSpace(value) {
        if (!this.HasProp("__IColorKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IColorKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorKeyFrameAnimation := IColorKeyFrameAnimation(outPtr)
        }

        return this.__IColorKeyFrameAnimation.put_InterpolationColorSpace(value)
    }

    /**
     * Inserts a key frame.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {Color} value The value of the key frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.colorkeyframeanimation.insertkeyframe
     */
    InsertKeyFrame(normalizedProgressKey, value) {
        if (!this.HasProp("__IColorKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IColorKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorKeyFrameAnimation := IColorKeyFrameAnimation(outPtr)
        }

        return this.__IColorKeyFrameAnimation.InsertKeyFrame(normalizedProgressKey, value)
    }

    /**
     * Inserts a key frame with the specified easing function.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {Color} value The value of the key frame.
     * @param {CompositionEasingFunction} easingFunction The easing function to use to interpolate between key frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.colorkeyframeanimation.insertkeyframe
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        if (!this.HasProp("__IColorKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IColorKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorKeyFrameAnimation := IColorKeyFrameAnimation(outPtr)
        }

        return this.__IColorKeyFrameAnimation.InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction)
    }

;@endregion Instance Methods
}
