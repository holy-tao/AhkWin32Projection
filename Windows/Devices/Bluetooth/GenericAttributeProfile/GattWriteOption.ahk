#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates what type of write operation is to be performed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriteoption
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattWriteOption extends Win32Enum{

    /**
     * The default GATT write procedure shall be used.
     * @type {Integer (Int32)}
     */
    static WriteWithResponse => 0

    /**
     * The Write Without Response procedure shall be used.
     * @type {Integer (Int32)}
     */
    static WriteWithoutResponse => 1
}
