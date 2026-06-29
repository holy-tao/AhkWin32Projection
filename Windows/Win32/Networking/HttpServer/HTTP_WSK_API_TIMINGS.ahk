#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_WSK_API_TIMINGS {
    #StructPack 8

    ConnectCount : Int64

    ConnectSum : Int64

    DisconnectCount : Int64

    DisconnectSum : Int64

    SendCount : Int64

    SendSum : Int64

    ReceiveCount : Int64

    ReceiveSum : Int64

    ReleaseCount : Int64

    ReleaseSum : Int64

    ControlSocketCount : Int64

    ControlSocketSum : Int64

}
