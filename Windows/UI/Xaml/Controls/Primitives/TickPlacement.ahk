#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the position of tick marks in a [Slider](../windows.ui.xaml.controls/slider.md) in relation to the track that the control implements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.tickplacement
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class TickPlacement extends Win32Enum{

    /**
     * No tick marks appear.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Tick marks appear above the track for a horizontal [Slider](../windows.ui.xaml.controls/slider.md), or to the left of the track for a vertical [Slider](../windows.ui.xaml.controls/slider.md).
     * @type {Integer (Int32)}
     */
    static TopLeft => 1

    /**
     * Tick marks appear below the track for a horizontal [Slider](../windows.ui.xaml.controls/slider.md), or to the right of the track for a vertical [Slider](../windows.ui.xaml.controls/slider.md).
     * @type {Integer (Int32)}
     */
    static BottomRight => 2

    /**
     * Tick marks appear on both sides of either a horizontal or vertical track.
     * @type {Integer (Int32)}
     */
    static Outside => 3

    /**
     * Tick marks appear directly on the track.
     * @type {Integer (Int32)}
     */
    static Inline => 4
}
