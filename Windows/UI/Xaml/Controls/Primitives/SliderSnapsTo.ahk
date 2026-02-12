#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how a [Slider](../windows.ui.xaml.controls/slider.md) or related range control class conforms the indicator position to its steps or tick marks.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.slidersnapsto
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class SliderSnapsTo extends Win32Enum{

    /**
     * Conform the indicator to the step values.
     * @type {Integer (Int32)}
     */
    static StepValues => 0

    /**
     * Conform the indicator to the tick marks.
     * @type {Integer (Int32)}
     */
    static Ticks => 1
}
