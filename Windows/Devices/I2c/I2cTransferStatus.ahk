#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes whether the data transfers that the [ReadPartial](i2cdevice_readpartial_589466211.md), [WritePartial](i2cdevice_writepartial_1107922632.md), or [WriteReadPartial](i2cdevice_writereadpartial_776061530.md) method performed succeeded, or provides the reason that the transfers did not succeed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2ctransferstatus
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class I2cTransferStatus extends Win32Enum{

    /**
     * The data was entirely transferred. For [WriteReadPartial](i2cdevice_writereadpartial_776061530.md), the data for both the write and the read operations was entirely transferred.
     * 
     * For this status code, the value of the **I2cTransferResult.BytesTransferred** member that the method returns is the same as the size of the buffer you specified when you called the method, or is equal to the sum of the sizes of two buffers that you specified for [WriteReadPartial](i2cdevice_writereadpartial_776061530.md).
     * @type {Integer (Int32)}
     */
    static FullTransfer => 0

    /**
     * The I<sup>2</sup> C device negatively acknowledged the data transfer before all of the data was transferred.
     * 
     * For this status code, the value of the **I2cTransferResult.BytesTransferred** member that the method returns is the number of bytes actually transferred. For [WriteReadPartial](i2cdevice_writereadpartial_776061530.md), the value is the sum of the number of bytes that the operation wrote and the number of bytes that the operation read.
     * @type {Integer (Int32)}
     */
    static PartialTransfer => 1

    /**
     * The bus address was not acknowledged.
     * 
     * For this status code, the value of the **I2cTransferResult.BytesTransferred** member that the method returns of the method is 0.
     * @type {Integer (Int32)}
     */
    static SlaveAddressNotAcknowledged => 2

    /**
     * The transfer failed due to the clock being stretched for too long. Ensure the clock line is not being held low.
     * @type {Integer (Int32)}
     */
    static ClockStretchTimeout => 3

    /**
     * The transfer failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownError => 4
}
