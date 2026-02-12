#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the modes in which you can connect to an inter-integrated circuit (I<sup>2</sup> C) bus address. These modes determine whether other connections to the I<sup>2</sup> C bus address can be opened while you are connected to the I<sup>2</sup> C bus address.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.provideri2csharingmode
 * @namespace Windows.Devices.I2c.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderI2cSharingMode extends Win32Enum{

    /**
     * Connects to the I<sup>2</sup> C bus address exclusively, so that no other connection to the I<sup>2</sup> C bus address can be made while you remain connected. This mode is the default mode.
     * @type {Integer (Int32)}
     */
    static Exclusive => 0

    /**
     * Connects to the I<sup>2</sup> C bus address in shared mode, so that other connections to the I<sup>2</sup> C bus address can be made while you remain connected.
     * 
     * You can perform all operations on shared connections, but use such connections with care. When multiple client apps change the global state of the I<sup>2</sup> C device, race conditions can result.
     * 
     * An example use case for using a shared connection is a sensor that obtains readings without changing the state of the device.
     * @type {Integer (Int32)}
     */
    static Shared => 1
}
