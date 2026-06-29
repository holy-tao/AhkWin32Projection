#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_UNKNOWN_HEADER.ahk" { HTTP_UNKNOWN_HEADER }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_ERROR_HEADERS_PARAM {
    #StructPack 8

    StatusCode : UInt16

    HeaderCount : UInt16

    Headers : HTTP_UNKNOWN_HEADER.Ptr

}
