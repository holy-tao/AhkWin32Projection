#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ObjectKeyFrame.ahk
#Include .\IDiscreteObjectKeyFrame.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates from the [Object](/dotnet/api/system.object?view=dotnet-uwp-10.0&preserve-view=true) value of the previous key frame to its own [Value](objectkeyframe_value.md) using discrete values.
 * @remarks
 * Key-frame animations permit more than one target value that is reached at a point along the animation timeline. In other words each key frame can specify a different intermediate value, and the last key frame reached is the final animation value. By specifying multiple values to animate, you can make more complex animations.
 * 
 * DiscreteObjectKeyFrame is the only keyframe type permitted in an [ObjectAnimationUsingKeyFrames](objectanimationusingkeyframes.md). There are no linear interpolations or other interpolation logic that's possible for changing object values as the animation runs. The old object is removed at the [KeyTime](objectkeyframe_keytime.md) and the new object that is the value of the keyframe with that [KeyTime](objectkeyframe_keytime.md) replaces it.
 * 
 * There are several scenarios where using [ObjectAnimationUsingKeyFrames](objectanimationusingkeyframes.md) rather than a typed animation is useful. Some of them are:
 * + Creating the [Storyboard](storyboard.md) for a visual state and using a value that is a [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension) reference, rather than one of the typed values. This gives you the ability to reference system theme resources from a visual state. For more info see [Storyboarded animations for visual states](/previous-versions/windows/apps/jj819808(v=win.10)).
 * + Animating **int** or **byte** values.
 * + Animating structures used in UI definitions and visual states, such as [GridLength](../windows.ui.xaml/gridlength.md). You can't animate the properties of the structure but you can swap the entire structure value with a DiscreteObjectKeyFrame and a new [GridLength](../windows.ui.xaml/gridlength.md).
 * 
 * 
 * For more info on how to use key-frame animations, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.discreteobjectkeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DiscreteObjectKeyFrame extends ObjectKeyFrame {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDiscreteObjectKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDiscreteObjectKeyFrame.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DiscreteObjectKeyFrame](discreteobjectkeyframe.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DiscreteObjectKeyFrame")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
