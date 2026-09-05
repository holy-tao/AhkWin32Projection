#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_INITIALIZE extends Win32BitflagEnum {

    /**
     * Native name: HTTP_INITIALIZE_CONFIG
     * @type {Integer (UInt32)}
     */
    static CONFIG => 2

    /**
     * Native name: HTTP_INITIALIZE_SERVER
     * @type {Integer (UInt32)}
     */
    static SERVER => 1
}
