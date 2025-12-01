#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DISPLAYCONFIG_SCANLINE_ORDERING enumeration specifies the method that the display uses to create an image on a screen.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ne-wingdi-displayconfig_scanline_ordering
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_SCANLINE_ORDERING extends Win32Enum{

    /**
     * Indicates that scan-line ordering of the output is unspecified. The caller can only set the <b>scanLineOrdering</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info">DISPLAYCONFIG_PATH_TARGET_INFO</a> structure in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdisplayconfig">SetDisplayConfig</a> function to DISPLAYCONFIG_SCANLINE_ORDERING_UNSPECIFIED if the caller also set the refresh rate denominator and numerator of the <b>refreshRate</b> member both to zero. In this case, <b>SetDisplayConfig</b> uses the best refresh rate it can find.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_SCANLINE_ORDERING_UNSPECIFIED => 0

    /**
     * Indicates that the output is a progressive image.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_SCANLINE_ORDERING_PROGRESSIVE => 1

    /**
     * Indicates that the output is an interlaced image that is created beginning with the upper field.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED => 2

    /**
     * Indicates that the output is an interlaced image that is created beginning with the upper field.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_UPPERFIELDFIRST => 2

    /**
     * Indicates that the output is an interlaced image that is created beginning with the lower field.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_LOWERFIELDFIRST => 3
}
