#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the repeat mode that a [RepeatBehavior](repeatbehavior.md) raw value represents.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehaviortype
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class RepeatBehaviorType extends Win32Enum{

    /**
     * The [RepeatBehavior](repeatbehavior.md) represents a case where the timeline should repeat for a fixed number of complete runs.
     * @type {Integer (Int32)}
     */
    static Count => 0

    /**
     * The [RepeatBehavior](repeatbehavior.md) represents a case where the timeline should repeat for a time duration, which might result in an animation terminating part way through.
     * @type {Integer (Int32)}
     */
    static Duration => 1

    /**
     * The [RepeatBehavior](repeatbehavior.md) represents a case where the timeline should repeat indefinitely.
     * @type {Integer (Int32)}
     */
    static Forever => 2
}
