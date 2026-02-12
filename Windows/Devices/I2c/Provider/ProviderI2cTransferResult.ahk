#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about whether the data transfers that the [ReadPartial](ii2cdeviceprovider_readpartial_589466211.md), [WritePartial](ii2cdeviceprovider_writepartial_1107922632.md), or [WriteReadPartial](ii2cdeviceprovider_writereadpartial_776061530.md) method performed succeeded, and the actual number of bytes the method transferred.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.provideri2ctransferresult
 * @namespace Windows.Devices.I2c.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderI2cTransferResult extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An enumeration value that indicates if the read or write operation transferred the full number of bytes that the method requested, or the reason that the full transfer did not succeed. For [WriteReadPartial](ii2cdeviceprovider_writereadpartial_776061530.md), the value indicates whether the data for both the write and the read operations was entirely transferred.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The actual number of bytes that the operation actually transferred. The following table describes what this value represents for each method.
     * 
     * | Method | Description |
     * |---|---|
     * | [ReadPartial](ii2cdeviceprovider_readpartial_589466211.md) | The actual number of bytes that the read operation read into the buffer. If the value of the **Status** member is **ProviderI2CTransferStatus.PartialTransfer**, this value may be less than the number of bytes in the buffer that you specified in the *buffer* parameter. |
     * | [WritePartial](ii2cdeviceprovider_writepartial_1107922632.md) | The actual number of bytes that the write operation transferred to the I2 C device. If the value of the **Status** member is **ProviderI2CTransferStatus.PartialTransfer**, this value may be less than the number of bytes in the buffer that you specified in the *buffer* parameter. |
     * | [WriteReadPartial](ii2cdeviceprovider_writereadpartial_776061530.md) | The actual number of bytes that the operation transferred, which is the sum of the number of bytes that the operation wrote and the number of bytes that the operation read. If the value of the **Status** member is **ProviderI2CTransferStatus.PartialTransfer**, this value may be less than the sum of lengths of the buffers that you specified in the *writeBuffer* and *readBuffer* parameters. |
     * @type {Integer}
     */
    BytesTransferred {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
