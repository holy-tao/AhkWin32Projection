#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the value of the GATT ClientCharacteristicConfigurationDescriptor.
  * 
  * Indicates the state of the Client Characteristic Configuration descriptor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattclientcharacteristicconfigurationdescriptorvalue
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattClientCharacteristicConfigurationDescriptorValue extends Win32Enum{

    /**
     * Neither notification nor indications are enabled.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Characteristic notifications are enabled.
     * @type {Integer (Int32)}
     */
    static Notify => 1

    /**
     * Characteristic indications are enabled.
     * @type {Integer (Int32)}
     */
    static Indicate => 2
}
