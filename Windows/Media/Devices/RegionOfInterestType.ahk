#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the different types of regions of interest that can be detected the capture device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinteresttype
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class RegionOfInterestType extends Win32Enum{

    /**
     * The type of region of interest is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The region of interest is a detected face.
     * @type {Integer (Int32)}
     */
    static Face => 1
}
