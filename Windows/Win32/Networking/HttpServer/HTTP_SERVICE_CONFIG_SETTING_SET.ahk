#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_SETTING_KEY.ahk" { HTTP_SERVICE_CONFIG_SETTING_KEY }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SETTING_SET {
    #StructPack 4

    KeyDesc : HTTP_SERVICE_CONFIG_SETTING_KEY

    ParamDesc : UInt32

}
