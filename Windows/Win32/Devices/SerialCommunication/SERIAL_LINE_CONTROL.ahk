#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIAL_LINE_CONTROL {
    #StructPack 1

    StopBits : Int8

    Parity : Int8

    WordLength : Int8

}
