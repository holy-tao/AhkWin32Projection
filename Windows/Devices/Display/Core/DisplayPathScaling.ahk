#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how to scale content from a frame buffer to a target.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypathscaling
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayPathScaling extends Win32Enum{

    /**
     * Indicates that content should not be stretched at all. This is only applicable if the source and target resolutions are identical.
     * @type {Integer (Int32)}
     */
    static Identity => 0

    /**
     * Indicates that content should be centered within the target resolution, with no scaling. Any unoccupied space is rendered as black pixels.
     * @type {Integer (Int32)}
     */
    static Centered => 1

    /**
     * Indicates that content should be stretched to the exact target resolution.
     * @type {Integer (Int32)}
     */
    static Stretched => 2

    /**
     * Indicates that content should be stretched to fit within the target resolution, but without changing the source aspect ratio. Any unoccupied space is rendered as black pixels.
     * @type {Integer (Int32)}
     */
    static AspectRatioStretched => 3

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static Custom => 4

    /**
     * Indicates that the driver should determine how to scale the content.
     * @type {Integer (Int32)}
     */
    static DriverPreferred => 5
}
