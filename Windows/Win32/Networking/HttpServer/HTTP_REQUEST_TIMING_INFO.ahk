#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_TIMING_INFO {
    #StructPack 8

    RequestTimingCount : UInt32

    RequestTiming : Int64[30]

}
