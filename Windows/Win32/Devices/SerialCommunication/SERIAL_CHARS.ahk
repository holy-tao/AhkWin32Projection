#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIAL_CHARS {
    #StructPack 1

    EofChar : Int8

    ErrorChar : Int8

    BreakChar : Int8

    EventChar : Int8

    XonChar : Int8

    XoffChar : Int8

}
