#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIEFFESCAPE structure passes hardware-specific data directly to the device driver.
 * @see https://learn.microsoft.com/windows/win32/api/dinput/ns-dinput-dieffescape
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIEFFESCAPE {
    #StructPack 8

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Specifies a driver-specific command number. Contact the hardware vendor for a list of valid commands and their parameters.
     */
    dwCommand : UInt32

    /**
     * Points to the buffer containing the data required to perform the operation.
     */
    lpvInBuffer : IntPtr

    /**
     * Specifies the size, in bytes, of the <b>lpvInBuffer</b> buffer.
     */
    cbInBuffer : UInt32

    /**
     * Points to the buffer in which the operation's output data is returned.
     */
    lpvOutBuffer : IntPtr

    /**
     * On entry, specifies the size, in bytes, of the <b>lpvOutBuffer</b> buffer. On exit, specifies the number of bytes actually produced by the command.
     */
    cbOutBuffer : UInt32

}
