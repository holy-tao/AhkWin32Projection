#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PROTECTION_LEVEL_TYPE.ahk" { HTTP_PROTECTION_LEVEL_TYPE }
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_PROTECTION_LEVEL_INFO {
    #StructPack 4

    Flags : HTTP_PROPERTY_FLAGS

    Level : HTTP_PROTECTION_LEVEL_TYPE

}
