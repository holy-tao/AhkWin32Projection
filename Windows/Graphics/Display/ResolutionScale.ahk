#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the scale factor of the app window. The scale factor is determined by the operating system in response to high pixel density screens.
 * @remarks
 * The range of asset scale values that can be provided to MakeAppX for a UWP app is limited to 100, 125, 150, 200, 250, 300, 400 and 500.
 * 
 * For more info on scaling to pixel density, see [UX guidelines for layout and scaling](/windows/uwp/design/layout/screen-sizes-and-breakpoints-for-responsive-design).
 * 
 * The [Scaling according to DPI sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Scaling%20according%20to%20DPI%20sample) shows how to use the ResolutionScale enumeration.
 * 
 * For UWP apps and Windows Phone apps, we recommend these scale factors:
 * 
 * + UWP app (100/140/180)
 * + Windows Phone apps for Windows Phone 8.1 and later (100/140/240)
 * + Windows Phone apps for Windows Phone 8 (100/150/160)
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.resolutionscale
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class ResolutionScale extends Win32Enum{

    /**
     * Specifies that the scale of a display is invalid.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Specifies the scale of a display as 100 percent. This percentage indicates a minimum screen resolution for Windows all up is 1024x768.
     * @type {Integer (Int32)}
     */
    static Scale100Percent => 100

    /**
     * This value isn't used.
     * @type {Integer (Int32)}
     */
    static Scale120Percent => 120

    /**
     * Specifies the scale of a display as 125 percent.
     * @type {Integer (Int32)}
     */
    static Scale125Percent => 125

    /**
     * Specifies the scale of a display as 140 percent. This percentage indicates a minimum screen resolution to scale at 140 is 1440x1080.
     * @type {Integer (Int32)}
     */
    static Scale140Percent => 140

    /**
     * Specifies the scale of a display as 150 percent. Also applies to Windows Phone 8.
     * @type {Integer (Int32)}
     */
    static Scale150Percent => 150

    /**
     * Specifies the scale of a display as 160 percent. Applies to Windows Phone 8.
     * @type {Integer (Int32)}
     */
    static Scale160Percent => 160

    /**
     * Specifies the scale of a display as 175 percent.
     * @type {Integer (Int32)}
     */
    static Scale175Percent => 175

    /**
     * Specifies the scale of a display as 180 percent. This percentage indicates a minimum screen resolution to scale at 180 is 1920x1440.
     * @type {Integer (Int32)}
     */
    static Scale180Percent => 180

    /**
     * Specifies the scale of a display as 200 percent.
     * @type {Integer (Int32)}
     */
    static Scale200Percent => 200

    /**
     * This value isn't used.
     * @type {Integer (Int32)}
     */
    static Scale225Percent => 225

    /**
     * Specifies the scale of a display as 250 percent.
     * @type {Integer (Int32)}
     */
    static Scale250Percent => 250

    /**
     * Specifies the scale of a display as 300 percent.
     * @type {Integer (Int32)}
     */
    static Scale300Percent => 300

    /**
     * Specifies the scale of a display as 350 percent.
     * @type {Integer (Int32)}
     */
    static Scale350Percent => 350

    /**
     * Specifies the scale of a display as 400 percent.
     * @type {Integer (Int32)}
     */
    static Scale400Percent => 400

    /**
     * Specifies the scale of a display as 450 percent.
     * @type {Integer (Int32)}
     */
    static Scale450Percent => 450

    /**
     * Specifies the scale of a display as 500 percent.
     * @type {Integer (Int32)}
     */
    static Scale500Percent => 500
}
