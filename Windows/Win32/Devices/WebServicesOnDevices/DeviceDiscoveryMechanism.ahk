#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class DeviceDiscoveryMechanism extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MulticastDiscovery => 0

    /**
     * @type {Integer (Int32)}
     */
    static DirectedDiscovery => 1

    /**
     * @type {Integer (Int32)}
     */
    static SecureDirectedDiscovery => 2
}
