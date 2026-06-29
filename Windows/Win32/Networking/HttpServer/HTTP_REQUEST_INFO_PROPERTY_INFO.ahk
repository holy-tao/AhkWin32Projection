#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_INFO_PROPERTY_INFO {
    #StructPack 8

    Flags : HTTP_PROPERTY_FLAGS

    RequestInfoFlags : Int64

}
