#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the color model and chroma subsampling format used to encode pixel data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformatpixelencoding
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayWireFormatPixelEncoding extends Win32Enum{

    /**
     * Indicates RGB color channels with no chroma subsampling.
     * @type {Integer (Int32)}
     */
    static Rgb444 => 0

    /**
     * Indicates YCbCr color channels with no chroma subsampling.
     * @type {Integer (Int32)}
     */
    static Ycc444 => 1

    /**
     * Indicates YCbCr color channels with 4:2:2 chroma subsampling.
     * @type {Integer (Int32)}
     */
    static Ycc422 => 2

    /**
     * Indicates YCbCr color channels with 4:2:0 chroma subsampling.
     * @type {Integer (Int32)}
     */
    static Ycc420 => 3

    /**
     * Indicates a single grayscale channel and no chroma data.
     * @type {Integer (Int32)}
     */
    static Intensity => 4
}
