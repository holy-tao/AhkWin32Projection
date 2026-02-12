#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Declares whether a [Duration](duration.md) has a special value of [Automatic](durationhelper_automatic.md) or [Forever](durationhelper_forever.md), or has valid information in its **TimeSpan** component.
 * @remarks
 * This value is used by the **Duration.Type** field, when you use C++ code and access the field data for a [Duration](duration.md).
 * 
 * For a [Duration](duration.md) the [Automatic](durationhelper_automatic.md) and [Forever](durationhelper_forever.md) values have different meaning depending on whether the [Duration](duration.md) is being used for the [Duration](../windows.ui.xaml.media.animation/timeline_duration.md) property on a [Storyboard](visualstate_storyboard.md) rather than on an individual storyboarded animation. For more info, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * 
 * For C# and Microsoft Visual Basic there is no **Type** property but you can use [HasTimeSpan](/dotnet/api/windows.ui.xaml.duration.hastimespan?view=dotnet-uwp-10.0&preserve-view=true) to get similar information.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationtype
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DurationType extends Win32Enum{

    /**
     * Has the [Automatic](durationhelper_automatic.md) special value.
     * @type {Integer (Int32)}
     */
    static Automatic => 0

    /**
     * Has valid information in the **TimeSpan** component.
     * @type {Integer (Int32)}
     */
    static TimeSpan => 1

    /**
     * Has the [Forever](durationhelper_forever.md) special value.
     * @type {Integer (Int32)}
     */
    static Forever => 2
}
