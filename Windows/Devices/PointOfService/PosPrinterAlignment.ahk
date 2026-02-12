#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible horizontal alignments of the text that a point-of-service printer prints on the page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinteralignment
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterAlignment extends Win32Enum{

    /**
     * Text is left-aligned.
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * Text is centered.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * Text is right-aligned.
     * @type {Integer (Int32)}
     */
    static Right => 2
}
