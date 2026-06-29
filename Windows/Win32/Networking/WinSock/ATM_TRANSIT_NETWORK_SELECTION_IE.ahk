#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_TRANSIT_NETWORK_SELECTION_IE {
    #StructPack 1

    TypeOfNetworkId : Int8

    NetworkIdPlan : Int8

    NetworkIdLength : Int8

    NetworkId : Int8[1]

}
