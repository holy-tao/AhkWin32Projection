#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIAL_COMMPROP {
    #StructPack 4

    PacketLength : UInt16

    PacketVersion : UInt16

    ServiceMask : UInt32

    Reserved1 : UInt32

    MaxTxQueue : UInt32

    MaxRxQueue : UInt32

    MaxBaud : UInt32

    ProvSubType : UInt32

    ProvCapabilities : UInt32

    SettableParams : UInt32

    SettableBaud : UInt32

    SettableData : UInt16

    SettableStopParity : UInt16

    CurrentTxQueue : UInt32

    CurrentRxQueue : UInt32

    ProvSpec1 : UInt32

    ProvSpec2 : UInt32

    ProvChar : WCHAR[1]

}
