#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the preferred location for positioning a [ToolTip](../windows.ui.xaml.controls/tooltip.md) relative to a visual element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.placementmode
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class PlacementMode extends Win32Enum{

    /**
     * The preferred location of the [ToolTip](../windows.ui.xaml.controls/tooltip.md) is below the target element when element receives keyboard focus, at the bottom of the mouse pointer when element is hovered over with pointer.
     * @type {Integer (Int32)}
     */
    static Bottom => 2

    /**
     * The preferred location of the [ToolTip](../windows.ui.xaml.controls/tooltip.md) is to the left of the target element when element receives keyboard focus, to the left of the mouse pointer when element is hovered over with pointer.
     * @type {Integer (Int32)}
     */
    static Left => 9

    /**
     * The preferred location of the [ToolTip](../windows.ui.xaml.controls/tooltip.md) is with the top-left corner of the tooltip positioned at the mouse pointer location when hovered over with mouse, above the target element when focused with keyboard.
     * @type {Integer (Int32)}
     */
    static Mouse => 7

    /**
     * The preferred location of the [ToolTip](../windows.ui.xaml.controls/tooltip.md) is to the right of the target element when element receives keyboard focus, to the right of the mouse pointer when element is hovered over with pointer.
     * @type {Integer (Int32)}
     */
    static Right => 4

    /**
     * The preferred location of the [ToolTip](../windows.ui.xaml.controls/tooltip.md) is above the target element when element receives keyboard focus, at the top of the mouse pointer when element is hovered over with pointer.
     * @type {Integer (Int32)}
     */
    static Top => 10
}
