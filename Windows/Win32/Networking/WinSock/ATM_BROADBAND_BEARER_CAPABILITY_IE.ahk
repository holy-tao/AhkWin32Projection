#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_BROADBAND_BEARER_CAPABILITY_IE {
    #StructPack 1

    BearerClass : Int8

    TrafficType : Int8

    TimingRequirements : Int8

    ClippingSusceptability : Int8

    UserPlaneConnectionConfig : Int8

}
