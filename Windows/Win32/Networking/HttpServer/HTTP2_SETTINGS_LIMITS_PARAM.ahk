#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP2_SETTINGS_LIMITS_PARAM {
    #StructPack 4

    Http2MaxSettingsPerFrame : UInt32

    Http2MaxSettingsPerMinute : UInt32

}
