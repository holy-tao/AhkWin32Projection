#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_QUIC_STREAM_API_TIMINGS.ahk" { HTTP_QUIC_STREAM_API_TIMINGS }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_QUIC_CONNECTION_API_TIMINGS {
    #StructPack 8

    OpenTime : Int64

    CloseTime : Int64

    StartTime : Int64

    ShutdownTime : Int64

    SecConfigCreateTime : Int64

    SecConfigDeleteTime : Int64

    GetParamCount : Int64

    GetParamSum : Int64

    SetParamCount : Int64

    SetParamSum : Int64

    SetCallbackHandlerCount : Int64

    SetCallbackHandlerSum : Int64

    ControlStreamTimings : HTTP_QUIC_STREAM_API_TIMINGS

}
