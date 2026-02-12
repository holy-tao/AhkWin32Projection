#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the preferred location for positioning a [FlyoutBase](flyoutbase.md) derived control relative to a visual element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutplacementmode
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class FlyoutPlacementMode extends Win32Enum{

    /**
     * Preferred location is above the target element.
     * @type {Integer (Int32)}
     */
    static Top => 0

    /**
     * Preferred location is below the target element.
     * @type {Integer (Int32)}
     */
    static Bottom => 1

    /**
     * Preferred location is to the left of the target element.
     * @type {Integer (Int32)}
     */
    static Left => 2

    /**
     * Preferred location is to the right of the target element.
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Preferred location is centered on the screen.
     * @type {Integer (Int32)}
     */
    static Full => 4

    /**
     * Preferred location is above the target element, with the left edge of flyout aligned with left edge of the target element.
     * @type {Integer (Int32)}
     */
    static TopEdgeAlignedLeft => 5

    /**
     * Preferred location is above the target element, with the right edge of flyout aligned with right edge of the target element.
     * @type {Integer (Int32)}
     */
    static TopEdgeAlignedRight => 6

    /**
     * Preferred location is below the target element, with the left edge of flyout aligned with left edge of the target element.
     * @type {Integer (Int32)}
     */
    static BottomEdgeAlignedLeft => 7

    /**
     * Preferred location is below the target element, with the right edge of flyout aligned with right edge of the target element.
     * @type {Integer (Int32)}
     */
    static BottomEdgeAlignedRight => 8

    /**
     * Preferred location is to the left of the target element, with the top edge of flyout aligned with top edge of the target element.
     * @type {Integer (Int32)}
     */
    static LeftEdgeAlignedTop => 9

    /**
     * Preferred location is to the left of the target element, with the bottom edge of flyout aligned with bottom edge of the target element.
     * @type {Integer (Int32)}
     */
    static LeftEdgeAlignedBottom => 10

    /**
     * Preferred location is to the right of the target element, with the top edge of flyout aligned with top edge of the target element.
     * @type {Integer (Int32)}
     */
    static RightEdgeAlignedTop => 11

    /**
     * Preferred location is to the right of the target element, with the bottom edge of flyout aligned with bottom edge of the target element.
     * @type {Integer (Int32)}
     */
    static RightEdgeAlignedBottom => 12

    /**
     * Preferred location is determined automatically.
     * @type {Integer (Int32)}
     */
    static Auto => 13
}
