#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represents units for an [IppResolution](ippresolution.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippresolutionunit
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppResolutionUnit extends Win32Enum{

    /**
     * Specifies units in dots per inch.
     * @type {Integer (Int32)}
     */
    static DotsPerInch => 0

    /**
     * Specifies units in dots per centimeter.
     * @type {Integer (Int32)}
     */
    static DotsPerCentimeter => 1
}
