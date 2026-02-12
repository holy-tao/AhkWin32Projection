#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\KeyFrameAnimation.ahk
#Include .\IQuaternionKeyFrameAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * A time-based animation that targets the Orientation property with one or more key frames.
  * 
  * The QuaternionKeyFrameAnimation class is one of the supported types of [KeyFrameAnimation](keyframeanimation.md)s that is used to animate the [Orientation](visual_orientation.md) property on a [Visual](visual.md). Quaternions are a useful and sometimes simpler way to think about rotations – Quaternions take the shortest path between angles and avoid issues like Gimbal Lock that rotation angle/axis and rotation matrices run into. A Quaternion is made up of two components: a scalar and vector part.
 * @remarks
 * An animation is associated with an object's property by calling [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) and specifying the property name and the animation. See the remarks section of [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) for a list of animatable properties.
 * 
 * A Quaternion is made up of two distinguishable parts: A vector and scalar component. When using with KeyFrame Animations, the Quaternion can be defined by the notation of System.Numerics of 4 floats or a Vector3 and a scalar. System.Numerics provides constructors for either of these notations.
 * 
 * When translating a rotation into a Quaternion, you can utilize System.Numerics Quaternion helper functions that allow you to create Quaternions out of an Axis/Angle combo, Rotation Matrix or Yaw/Pitch/Roll. In the example above, the same Quaternion could be constructed from the below helper:
 * 
 * ```csharp
 * Quaternion quaternion = Quaternion.CreateFromAxisAngle(new Vector3(1.0f, 0.0f, 0.0f), 0.78f);
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.quaternionkeyframeanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class QuaternionKeyFrameAnimation extends KeyFrameAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IQuaternionKeyFrameAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IQuaternionKeyFrameAnimation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Inserts a key frame.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {Quaternion} value The value of the key frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.quaternionkeyframeanimation.insertkeyframe
     */
    InsertKeyFrame(normalizedProgressKey, value) {
        if (!this.HasProp("__IQuaternionKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IQuaternionKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuaternionKeyFrameAnimation := IQuaternionKeyFrameAnimation(outPtr)
        }

        return this.__IQuaternionKeyFrameAnimation.InsertKeyFrame(normalizedProgressKey, value)
    }

    /**
     * Inserts a key frame with the specified easing function.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation [Duration](keyframeanimation_duration.md). Allowed value is from 0.0 to 1.0.
     * @param {Quaternion} value The value of the key frame.
     * @param {CompositionEasingFunction} easingFunction The easing function to use to interpolate between key frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.quaternionkeyframeanimation.insertkeyframe
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        if (!this.HasProp("__IQuaternionKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IQuaternionKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuaternionKeyFrameAnimation := IQuaternionKeyFrameAnimation(outPtr)
        }

        return this.__IQuaternionKeyFrameAnimation.InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction)
    }

;@endregion Instance Methods
}
