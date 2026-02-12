#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ColorKeyFrame.ahk
#Include .\ILinearColorKeyFrame.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates from the [Color](../windows.ui/color.md) value of the previous key frame to its own [Value](colorkeyframe_value.md) using linear interpolation.
 * @remarks
 * Key-frame animations permit more than one target value that is reached at a point along the animation timeline. In other words each key frame can specify a different intermediate value, and the last key frame reached is the final animation value. By specifying multiple values to animate, you can make more complex animations. You'd typically have at least two keyframes in a [ColorAnimationUsingKeyFrames](coloranimationusingkeyframes.md) with LinearColorKeyFrame, otherwise a [ColorAnimation](coloranimation.md) would have been simpler.
 * 
 * For more info on how to use key-frame animations, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.linearcolorkeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class LinearColorKeyFrame extends ColorKeyFrame {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILinearColorKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILinearColorKeyFrame.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [LinearColorKeyFrame](linearcolorkeyframe.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.LinearColorKeyFrame")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
