#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Represents power states for fixed-purpose devices.
 * @remarks
 * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
 * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
 * @see https://learn.microsoft.com/uwp/api/windows.system.powerstate
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class PowerState extends Win32Enum{

    /**
     * Represents the Connected Standby state.
     * @type {Integer (Int32)}
     */
    static ConnectedStandby => 0

    /**
     * Represents the Sleep S3 state.
     * @type {Integer (Int32)}
     */
    static SleepS3 => 1
}
