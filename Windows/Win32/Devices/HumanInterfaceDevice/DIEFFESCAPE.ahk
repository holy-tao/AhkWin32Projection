#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIEFFESCAPE structure passes hardware-specific data directly to the device driver.
 * @see https://learn.microsoft.com/windows/win32/api/dinput/ns-dinput-dieffescape
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIEFFESCAPE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a driver-specific command number. Contact the hardware vendor for a list of valid commands and their parameters.
     * @type {Integer}
     */
    dwCommand {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the buffer containing the data required to perform the operation.
     * @type {Pointer<Void>}
     */
    lpvInBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the size, in bytes, of the <b>lpvInBuffer</b> buffer.
     * @type {Integer}
     */
    cbInBuffer {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Points to the buffer in which the operation's output data is returned.
     * @type {Pointer<Void>}
     */
    lpvOutBuffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * On entry, specifies the size, in bytes, of the <b>lpvOutBuffer</b> buffer. On exit, specifies the number of bytes actually produced by the command.
     * @type {Integer}
     */
    cbOutBuffer {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
