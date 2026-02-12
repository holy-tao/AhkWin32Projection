#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the scrolling direction of the line display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayscrolldirection
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayScrollDirection extends Win32Enum{

    /**
     * The line display scrolls up. Only supported if the parent [LineDisplay.IsVerticalMarqueeSupported](linedisplaycapabilities_isverticalmarqueesupported.md) is True.
     * @type {Integer (Int32)}
     */
    static Up => 0

    /**
     * The line display scrolls right. Only supported if the parent [LineDisplay.IsHorizontalMarqueeSupported](linedisplaycapabilities_ishorizontalmarqueesupported.md) is True.
     * @type {Integer (Int32)}
     */
    static Down => 1

    /**
     * The line display scrolls left. Only supported if the parent [LineDisplay.IsHorizontalMarqueeSupported](linedisplaycapabilities_ishorizontalmarqueesupported.md) is True.
     * @type {Integer (Int32)}
     */
    static Left => 2

    /**
     * The line display scrolls down. Only supported if the parent [LineDisplay.IsVerticalMarqueeSupported](linedisplaycapabilities_isverticalmarqueesupported.md) is True.
     * @type {Integer (Int32)}
     */
    static Right => 3
}
