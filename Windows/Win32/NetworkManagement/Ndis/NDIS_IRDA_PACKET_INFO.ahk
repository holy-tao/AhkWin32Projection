#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_IRDA_PACKET_INFO {
    #StructPack 4

    ExtraBOFs : UInt32

    MinTurnAroundTime : UInt32

}
