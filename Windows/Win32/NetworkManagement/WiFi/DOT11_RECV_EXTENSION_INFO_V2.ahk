#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_IV48_COUNTER.ahk" { DOT11_IV48_COUNTER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_RECV_EXTENSION_INFO_V2 {
    #StructPack 8

    uVersion : UInt32

    pvReserved : IntPtr

    dot11PhyType : DOT11_PHY_TYPE

    uChCenterFrequency : UInt32

    lRSSI : Int32

    uRSSI : UInt32

    ucPriority : Int8

    ucDataRate : Int8

    ucPeerMacAddress : Int8[6]

    dwExtendedStatus : UInt32

    hWEPOffloadContext : HANDLE

    hAuthOffloadContext : HANDLE

    usWEPAppliedMask : UInt16

    usWPAMSDUPriority : UInt16

    dot11LowestIV48Counter : DOT11_IV48_COUNTER

    usDot11LeftRWBitMap : UInt16

    dot11HighestIV48Counter : DOT11_IV48_COUNTER

    usDot11RightRWBitMap : UInt16

    usNumberOfMPDUsReceived : UInt16

    usNumberOfFragments : UInt16

    pNdisPackets : IntPtr[1]

}
