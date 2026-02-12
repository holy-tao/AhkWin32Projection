#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the color modes for the scan source.
 * @remarks
 * If the scanner device doesn't support any of these color modes, the current scan source will be considered unavailable and the app won’t be able to scan from there.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannercolormode
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerColorMode extends Win32Enum{

    /**
     * 24-bit RGB color (3 channels at 8 bits per channel).
     * @type {Integer (Int32)}
     */
    static Color => 0

    /**
     * 8 bit or 4 bit grayscale (1 channel at 8 or 4 bits per channel). If the device supports both 4 and 8 bit grayscale the [DefaultColorMode](iimagescannersourceconfiguration_defaultcolormode.md) property will use 8 bit.
     * @type {Integer (Int32)}
     */
    static Grayscale => 1

    /**
     * 1 bit bi-tonal, also called monochrome or ‘black and white’ (1 channel at 1 bit per channel).
     * @type {Integer (Int32)}
     */
    static Monochrome => 2

    /**
     * The device automatically detects the right color mode based on the scan content. In this case the decision between color, grayscale and black and white for example relies on the device, and not the app.
     * @type {Integer (Int32)}
     */
    static AutoColor => 3
}
