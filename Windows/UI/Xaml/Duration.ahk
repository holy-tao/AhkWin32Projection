#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the duration of time that a [Timeline](../windows.ui.xaml.media.animation/timeline.md) is active, or more generally represents a duration of time that also supports two special values **Automatic** and **Forever**.
 * @remarks
 * A Duration value is used for these properties:
 * 
 * + [Timeline.Duration](../windows.ui.xaml.media.animation/timeline_duration.md) (can be set on either a [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) or an animation)
 * + [VisualTransition.GeneratedDuration](visualtransition_generatedduration.md)
 * + [RepeatBehavior.Duration](/uwp/api/windows.ui.xaml.media.animation.repeatbehavior.duration)
 * + [MediaElement.NaturalDuration](../windows.ui.xaml.controls/mediaelement_naturalduration.md) (this usage isn't part of the storyboarded animation scenario; all the others are)
 * 
 * For more info on how to use a Duration as part of a [Timeline](../windows.ui.xaml.media.animation/timeline.md), including code examples, see [Storyboarded animations](/windows/uwp/design/motion/storyboarded-animations) or [Timeline.Duration](../windows.ui.xaml.media.animation/timeline_duration.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.duration
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Duration extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The **TimeSpan** value component.
     * <!--DON'T link this keyword, the type is projected so you actually need two different links-->
     * @type {Pointer<TimeSpan>}
     */
    TimeSpan {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The type as a member of the enumeration.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
