#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the type of [Scroll](scrollbar_scroll.md) event that occurred.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrolleventtype
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ScrollEventType extends Win32Enum{

    /**
     * The [Thumb](thumb.md) moved a distance specified by the value of [SmallChange](rangebase_smallchange.md). The [Thumb](thumb.md) moved to the left for a horizontal [ScrollBar](scrollbar.md) or upward for a vertical [ScrollBar](scrollbar.md).
     * @type {Integer (Int32)}
     */
    static SmallDecrement => 0

    /**
     * The [Thumb](thumb.md) moved a distance specified by the value of [SmallChange](rangebase_smallchange.md). The [Thumb](thumb.md) moved to the right for a horizontal [ScrollBar](scrollbar.md) or downward for a vertical [ScrollBar](scrollbar.md).
     * @type {Integer (Int32)}
     */
    static SmallIncrement => 1

    /**
     * The [Thumb](thumb.md) moved a distance specified by the value of [LargeChange](rangebase_largechange.md). The [Thumb](thumb.md) moved to the left for a horizontal [ScrollBar](scrollbar.md) or upward for a vertical [ScrollBar](scrollbar.md).
     * @type {Integer (Int32)}
     */
    static LargeDecrement => 2

    /**
     * The [Thumb](thumb.md) moved a distance specified by the value of [LargeChange](rangebase_largechange.md). The [Thumb](thumb.md) moved to the right for a horizontal [ScrollBar](scrollbar.md) or downward for a vertical [ScrollBar](scrollbar.md).
     * @type {Integer (Int32)}
     */
    static LargeIncrement => 3

    /**
     * The [Thumb](thumb.md) moved to a new position because the user selected **Scroll Here** in the shortcut menu of the [ScrollBar](scrollbar.md).
     * @type {Integer (Int32)}
     */
    static ThumbPosition => 4

    /**
     * The [Thumb](thumb.md) was dragged and caused a [PointerMoved](../windows.ui.xaml/uielement_pointermoved.md) event. A [Scroll](scrollbar_scroll.md) event of this ScrollEventType may occur more than one time when the [Thumb](thumb.md) is dragged in the [ScrollBar](scrollbar.md).
     * @type {Integer (Int32)}
     */
    static ThumbTrack => 5

    /**
     * The [Thumb](thumb.md) moved to the [Minimum](rangebase_minimum.md) position of the [ScrollBar](scrollbar.md).
     * @type {Integer (Int32)}
     */
    static First => 6

    /**
     * The [Thumb](thumb.md) moved to the [Maximum](rangebase_maximum.md) position of the [ScrollBar](scrollbar.md).
     * @type {Integer (Int32)}
     */
    static Last => 7

    /**
     * The [Thumb](thumb.md) was dragged to a new position and is now no longer being dragged by the user.
     * @type {Integer (Int32)}
     */
    static EndScroll => 8
}
