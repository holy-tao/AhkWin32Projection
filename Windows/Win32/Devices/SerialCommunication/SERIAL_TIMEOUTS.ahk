#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIAL_TIMEOUTS {
    #StructPack 4

    ReadIntervalTimeout : UInt32

    ReadTotalTimeoutMultiplier : UInt32

    ReadTotalTimeoutConstant : UInt32

    WriteTotalTimeoutMultiplier : UInt32

    WriteTotalTimeoutConstant : UInt32

}
