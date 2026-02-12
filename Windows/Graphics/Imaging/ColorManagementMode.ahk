#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the color management behavior when obtaining pixel data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.colormanagementmode
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class ColorManagementMode extends Win32Enum{

    /**
     * No color management is performed
     * @type {Integer (Int32)}
     */
    static DoNotColorManage => 0

    /**
     * Color management is performed from the color space embedded with the source bitmap to the sRGB color space.
     * @type {Integer (Int32)}
     */
    static ColorManageToSRgb => 1
}
