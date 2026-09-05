#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_RECEIVE_HTTP_REQUEST_FLAGS extends Win32Enum {

    /**
     * Native name: HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY
     * @type {Integer (UInt32)}
     */
    static FLAG_COPY_BODY => 1

    /**
     * Native name: HTTP_RECEIVE_REQUEST_FLAG_FLUSH_BODY
     * @type {Integer (UInt32)}
     */
    static FLAG_FLUSH_BODY => 2
}
