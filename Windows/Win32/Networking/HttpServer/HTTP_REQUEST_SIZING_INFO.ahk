#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_SIZING_INFO {
    #StructPack 8

    Flags : Int64

    RequestIndex : UInt32

    RequestSizingCount : UInt32

    RequestSizing : Int64[5]

}
