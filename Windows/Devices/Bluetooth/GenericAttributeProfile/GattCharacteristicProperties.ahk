#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the values for the GATT characteristic properties as well as the GATT Extended Characteristic Properties Descriptor.
  * 
  * Provides a collection of flags representing the GATT Characteristic Properties and if the GATT Extended Properties Descriptor is present the GATT Extended Characteristic properties of the characteristic.
  * 
  * Represents the GATT characteristic properties, as defined by the GATT profile, and if the ExtendedProperties flag is present it also represents the properties of the Extended Characteristic Properties Descriptor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicproperties
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattCharacteristicProperties extends Win32BitflagEnum{

    /**
     * The characteristic doesn’t have any properties that apply.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The characteristic supports broadcasting
     * @type {Integer (UInt32)}
     */
    static Broadcast => 1

    /**
     * The characteristic is readable
     * @type {Integer (UInt32)}
     */
    static Read => 2

    /**
     * The characteristic supports Write Without Response
     * @type {Integer (UInt32)}
     */
    static WriteWithoutResponse => 4

    /**
     * The characteristic is writable
     * @type {Integer (UInt32)}
     */
    static Write => 8

    /**
     * The characteristic is notifiable
     * @type {Integer (UInt32)}
     */
    static Notify => 16

    /**
     * The characteristic is indicatable
     * @type {Integer (UInt32)}
     */
    static Indicate => 32

    /**
     * The characteristic supports signed writes
     * @type {Integer (UInt32)}
     */
    static AuthenticatedSignedWrites => 64

    /**
     * The ExtendedProperties Descriptor is present
     * @type {Integer (UInt32)}
     */
    static ExtendedProperties => 128

    /**
     * The characteristic supports reliable writes
     * @type {Integer (UInt32)}
     */
    static ReliableWrites => 256

    /**
     * The characteristic has writable auxiliaries
     * @type {Integer (UInt32)}
     */
    static WritableAuxiliaries => 512
}
