#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIAL_XOFF_COUNTER {
    #StructPack 4

    Timeout : UInt32

    Counter : Int32

    XoffChar : Int8

}
