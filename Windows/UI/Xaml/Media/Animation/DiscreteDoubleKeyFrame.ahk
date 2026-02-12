#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DoubleKeyFrame.ahk
#Include .\IDiscreteDoubleKeyFrame.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates from the [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) value of the previous key frame to its own [Value](doublekeyframe_value.md) using discrete values.
 * @remarks
 * Key-frame animations permit more than one target value that is reached at a point along the animation timeline. In other words each key frame can specify a different intermediate value, and the last key frame reached is the final animation value. By specifying multiple values to animate, you can make more complex animations. You can mix discrete, linear, and spline keyframes in the same keyframe collection.
 * 
 * For more info on how to use key-frame animations, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.discretedoublekeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DiscreteDoubleKeyFrame extends DoubleKeyFrame {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDiscreteDoubleKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDiscreteDoubleKeyFrame.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DiscreteDoubleKeyFrame](discretedoublekeyframe.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DiscreteDoubleKeyFrame")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
