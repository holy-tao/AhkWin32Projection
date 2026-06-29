#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_QUIC_STREAM_API_TIMINGS {
    #StructPack 8

    OpenCount : Int64

    OpenSum : Int64

    CloseCount : Int64

    CloseSum : Int64

    StartCount : Int64

    StartSum : Int64

    ShutdownCount : Int64

    ShutdownSum : Int64

    SendCount : Int64

    SendSum : Int64

    ReceiveSetEnabledCount : Int64

    ReceiveSetEnabledSum : Int64

    GetParamCount : Int64

    GetParamSum : Int64

    SetParamCount : Int64

    SetParamSum : Int64

    SetCallbackHandlerCount : Int64

    SetCallbackHandlerSum : Int64

}
