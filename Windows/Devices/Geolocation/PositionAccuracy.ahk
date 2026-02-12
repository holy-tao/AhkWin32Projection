#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the requested accuracy level for the location data that the application uses.
 * @remarks
 * The [PositionAccuracy](positionaccuracy.md) setting controls the balance between location accuracy and power consumption.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.positionaccuracy
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class PositionAccuracy extends Win32Enum{

    /**
     * Optimize for power, performance, and other cost considerations.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Deliver the most accurate report possible. This includes using services that might charge money, or consuming higher levels of battery power or connection bandwidth. An accuracy level of `High` may degrade system performance and should be used only when necessary.
     * @type {Integer (Int32)}
     */
    static High => 1
}
