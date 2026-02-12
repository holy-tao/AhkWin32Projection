#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the capabilities of the point-of-service printer to draw ruled lines.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterruledlinecapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterRuledLineCapabilities extends Win32BitflagEnum{

    /**
     * The printer cannot draw ruled lines.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The printer can draw ruled horizontal lines.
     * @type {Integer (UInt32)}
     */
    static Horizontal => 1

    /**
     * The printer can draw ruled vertical lines.
     * @type {Integer (UInt32)}
     */
    static Vertical => 2
}
