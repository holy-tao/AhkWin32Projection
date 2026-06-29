#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LM_IRPARMS {
    #StructPack 4

    nTXDataBytes : UInt32

    nRXDataBytes : UInt32

    nBaudRate : UInt32

    thresholdTime : UInt32

    discTime : UInt32

    nMSLinkTurn : UInt16

    nTXPackets : Int8

    nRXPackets : Int8

}
