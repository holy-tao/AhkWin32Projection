#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_FAST_FORWARD_INFO {
    #StructPack 4

    Flags : HTTP_PROPERTY_FLAGS

    EnableFastForwarding : BOOLEAN

}
