#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the bus speeds that are available for connecting to an inter-integrated circuit (I<sup>2</sup> C) device. The bus speed is the frequency at which to clock the I<sup>2</sup> C bus when accessing the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cbusspeed
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class I2cBusSpeed extends Win32Enum{

    /**
     * The standard speed of 100 kilohertz (kHz). This speed is the default.
     * @type {Integer (Int32)}
     */
    static StandardMode => 0

    /**
     * A fast speed of 400 kHz.
     * @type {Integer (Int32)}
     */
    static FastMode => 1
}
