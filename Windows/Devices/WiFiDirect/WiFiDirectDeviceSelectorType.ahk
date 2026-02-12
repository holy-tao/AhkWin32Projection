#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the device selector type for Wi-Fi Direct.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdeviceselectortype
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectDeviceSelectorType extends Win32Enum{

    /**
     * A device interface.
     * @type {Integer (Int32)}
     */
    static DeviceInterface => 0

    /**
     * An associated endpoint. This includes other PC, tablets, and phones.
     * @type {Integer (Int32)}
     */
    static AssociationEndpoint => 1
}
