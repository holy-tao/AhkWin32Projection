#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes how a [Timeline](timeline.md) repeats its simple duration.
 * @remarks
 * There are three types of RepeatBehavior behaviors:
 * + Time span: specifies the active duration of a [Timeline](timeline.md), possibly repeating the animation if the [Timeline.Duration](timeline_duration.md) is shorter. For example, a [Timeline](timeline.md) with a simple [Timeline.Duration](timeline_duration.md) value of 1 second and a [RepeatBehavior.Duration](/uwp/api/windows.ui.xaml.media.animation.repeatbehavior.duration) value of 2.5 seconds will run for 2.5 iterations, and 2.5 seconds.
 * + Iteration count: specifies the number of times the simple duration of a [Timeline](timeline.md) plays. The default iteration count is 1.0, and this means the [Timeline](timeline.md) is active for exactly one of its simple durations. A count of 0.5 specifies that the timeline is active for half of its simple duration, while a count of 2 specifies that the timeline repeats its simple duration twice. For more information, see [Count](/uwp/api/windows.ui.xaml.media.animation.repeatbehavior.count).
 * + Forever: the [Timeline](timeline.md) repeats indefinitely.
 * 
 * 
 * A RepeatBehavior should only contain non-zero values for one of its two possible data properties **Count** or **Duration**. If the **RepeatBehaviorType** is **Count**, then the **Count** member of a RepeatBehavior is the relevant value. If the **RepeatBehaviorType** is **Duration**, then the **Duration** member of a RepeatBehavior is the relevant value. If the **RepeatBehaviorType** is **Forever**, then neither **Count** nor **Duration** are relevant; the repeat behavior is such that the targeted animation will repeat continuously without a limit.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehavior
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class RepeatBehavior extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of times a [Timeline](timeline.md) should repeat.
     * @type {Float}
     */
    Count {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The time span for which a [Timeline](timeline.md) should repeat.
     * @type {Pointer<TimeSpan>}
     */
    Duration {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The mode or type of repeat behavior that this instance represents, as a value of the enumeration.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
