#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The types of scan source for the scanning device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerscansource
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerScanSource extends Win32Enum{

    /**
     * The default source.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A flatbed scan source.
     * @type {Integer (Int32)}
     */
    static Flatbed => 1

    /**
     * A feeder scan source.
     * @type {Integer (Int32)}
     */
    static Feeder => 2

    /**
     * The scan source is automatically configured.
     * @type {Integer (Int32)}
     */
    static AutoConfigured => 3
}
