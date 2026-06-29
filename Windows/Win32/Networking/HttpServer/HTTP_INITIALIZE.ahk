#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_INITIALIZE extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_INITIALIZE_CONFIG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_INITIALIZE_SERVER => 1
}
