#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERIAL_TIMEOUTS.ahk" { SERIAL_TIMEOUTS }
#Import ".\SERIAL_HANDFLOW.ahk" { SERIAL_HANDFLOW }

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIAL_BASIC_SETTINGS {
    #StructPack 4

    Timeouts : SERIAL_TIMEOUTS

    HandFlow : SERIAL_HANDFLOW

    RxFifo : UInt32

    TxFifo : UInt32

}
