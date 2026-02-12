#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the automatic crop mode of the scanning device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerautocroppingmode
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerAutoCroppingMode extends Win32Enum{

    /**
     * Automatic detection is disabled. At the beginning of a new scan session, the [AutoCroppingMode](iimagescannersourceconfiguration_autocroppingmode.md) property is set to this value by default.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Scan a single scan region into individual, separate images.
     * @type {Integer (Int32)}
     */
    static SingleRegion => 1

    /**
     * Scan multiple scan regions into individual, separate images.
     * @type {Integer (Int32)}
     */
    static MultipleRegion => 2
}
