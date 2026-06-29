#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIAL_STATUS {
    #StructPack 4

    Errors : UInt32

    HoldReasons : UInt32

    AmountInInQueue : UInt32

    AmountInOutQueue : UInt32

    EofReceived : BOOLEAN

    WaitForImmediate : BOOLEAN

}
