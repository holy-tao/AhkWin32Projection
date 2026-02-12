#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the filter used to optimize the image prior to image compression in PNG images.
 * @remarks
 * The PNG filter modes only affect compression efficiency and not image quality. **None** does not perform any filtering and is typically the fastest but consumes the most space. **Sub**, **Up**, **Average** and **Paeth** filtering perform differently across various images. **Adaptive** filtering attempts to select the most efficient of the previous filter modes for each scanline in the image. This typically performs the slowest but consumes the least space.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.pngfiltermode
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class PngFilterMode extends Win32Enum{

    /**
     * The filter type will be chosen automatically.
     * @type {Integer (Int32)}
     */
    static Automatic => 0

    /**
     * The image is unmodified.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * The Sub type filter is applied.
     * @type {Integer (Int32)}
     */
    static Sub => 2

    /**
     * The Up filter type is applied.
     * @type {Integer (Int32)}
     */
    static Up => 3

    /**
     * The Average type filter is applied.
     * @type {Integer (Int32)}
     */
    static Average => 4

    /**
     * The Paeth type filter is applied.
     * @type {Integer (Int32)}
     */
    static Paeth => 5

    /**
     * The Adaptive type filter is applied.
     * @type {Integer (Int32)}
     */
    static Adaptive => 6
}
