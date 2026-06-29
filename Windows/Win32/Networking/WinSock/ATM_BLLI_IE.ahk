#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_BLLI_IE {
    #StructPack 4

    Layer2Protocol : UInt32

    Layer2Mode : Int8

    Layer2WindowSize : Int8

    Layer2UserSpecifiedProtocol : UInt32

    Layer3Protocol : UInt32

    Layer3Mode : Int8

    Layer3DefaultPacketSize : Int8

    Layer3PacketWindowSize : Int8

    Layer3UserSpecifiedProtocol : UInt32

    Layer3IPI : UInt32

    SnapID : Int8[5]

}
