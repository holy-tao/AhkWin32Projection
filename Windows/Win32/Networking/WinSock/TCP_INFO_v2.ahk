#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TCPSTATE.ahk" { TCPSTATE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_INFO_v2 {
    #StructPack 8

    State : TCPSTATE

    Mss : UInt32

    ConnectionTimeMs : Int64

    TimestampsEnabled : BOOLEAN

    RttUs : UInt32

    MinRttUs : UInt32

    BytesInFlight : UInt32

    Cwnd : UInt32

    SndWnd : UInt32

    RcvWnd : UInt32

    RcvBuf : UInt32

    BytesOut : Int64

    BytesIn : Int64

    BytesReordered : UInt32

    BytesRetrans : UInt32

    FastRetrans : UInt32

    DupAcksIn : UInt32

    TimeoutEpisodes : UInt32

    SynRetrans : Int8

    SndLimTransRwin : UInt32

    SndLimTimeRwin : UInt32

    SndLimBytesRwin : Int64

    SndLimTransCwnd : UInt32

    SndLimTimeCwnd : UInt32

    SndLimBytesCwnd : Int64

    SndLimTransSnd : UInt32

    SndLimTimeSnd : UInt32

    SndLimBytesSnd : Int64

    OutOfOrderPktsIn : UInt32

    EcnNegotiated : BOOLEAN

    EceAcksIn : UInt32

    PtoEpisodes : UInt32

}
