#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates the type of health check that can be performed on the devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposhealthchecklevel
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class UnifiedPosHealthCheckLevel extends Win32Enum{

    /**
     * Perform an unspecified test.
     * @type {Integer (Int32)}
     */
    static UnknownHealthCheckLevel => 0

    /**
     * Perform internal tests to that do not physically change the device.
     * @type {Integer (Int32)}
     */
    static POSInternal => 1

    /**
     * Perform a more thorough test that may change the device.
     * @type {Integer (Int32)}
     */
    static External => 2

    /**
     * Perform a interactive test of the device. The supporting service object will typically display a modal dialog box to present test options and results.
     * @type {Integer (Int32)}
     */
    static Interactive => 3
}
