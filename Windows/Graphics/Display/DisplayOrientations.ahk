#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the orientation of a rectangular monitor.
 * @remarks
 * Display orientation expresses the angle at which a monitor rotated in the clockwise direction to show a straight picture. For example, if the operating system reports orientation as 90 degrees, the user rotated the monitor 90 degrees clockwise to show a straight picture; if the user returns the monitor to its original position, the operating system reports orientation as 90 degrees counterclockwise. Applications typically use this property to translate the reading of an accelerometer or to translate the physical button events in accordance with the current screen rotation.
 * 
 * 
 * A device that is first oriented in landscape mode has the following angles of rotation:
 * 
 * + **Landscape** = 0 degrees
 * + **Portrait** = 90 degrees
 * + **LandscapeFlipped** = 180 degrees
 * + **PortraitFlipped** = 270 degrees
 * 
 * A device that is first oriented in portrait mode has the following angles of rotation:
 * 
 * + **Portrait** = 0 degrees
 * + **LandscapeFlipped** = 90 degrees
 * + **PortraitFlipped** = 180 degrees
 * + **Landscape** = 270 degrees
 * 
 * 
 * The [Scaling according to DPI sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/DisplayOrientation) shows how to use the DisplayOrientations enumeration.
 * 
 * The DisplayOrientations values describe the orientation of the display or monitor and not necessarily the orientation of your app. To determine the orientation of your app for layout purposes, use the [ApplicationView.Orientation](../windows.ui.viewmanagement/applicationview_orientation.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayorientations
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayOrientations extends Win32BitflagEnum{

    /**
     * No display orientation is specified.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Specifies that the monitor is oriented in landscape mode where the width of the display viewing area is greater than the height.
     * @type {Integer (UInt32)}
     */
    static Landscape => 1

    /**
     * Specifies that the monitor rotated 90 degrees in the clockwise direction to orient the display in portrait mode where the height of the display viewing area is greater than the width.
     * @type {Integer (UInt32)}
     */
    static Portrait => 2

    /**
     * Specifies that the monitor rotated another 90 degrees in the clockwise direction (to equal 180 degrees) to orient the display in landscape mode where the width of the display viewing area is greater than the height. This landscape mode is flipped 180 degrees from the **Landscape** mode.
     * @type {Integer (UInt32)}
     */
    static LandscapeFlipped => 4

    /**
     * Specifies that the monitor rotated another 90 degrees in the clockwise direction (to equal 270 degrees) to orient the display in portrait mode where the height of the display viewing area is greater than the width. This portrait mode is flipped 180 degrees from the **Portrait** mode.
     * @type {Integer (UInt32)}
     */
    static PortraitFlipped => 8
}
