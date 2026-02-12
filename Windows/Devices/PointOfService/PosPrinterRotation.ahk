#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible ways that a point-of-service printer can rotate the text or image on the page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterrotation
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterRotation extends Win32Enum{

    /**
     * The text or image is not rotated.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The text or image is rotated 90 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Right90 => 1

    /**
     * The text or image is rotated 90 degrees counterclockwise.
     * @type {Integer (Int32)}
     */
    static Left90 => 2

    /**
     * The text or image is upside-down.
     * @type {Integer (Int32)}
     */
    static Rotate180 => 3
}
