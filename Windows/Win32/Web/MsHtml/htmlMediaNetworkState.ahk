#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMediaNetworkState extends Win32Enum {

    /**
     * Native name: htmlMediaNetworkStateEmpty
     * @type {Integer (Int32)}
     */
    static Empty => 0

    /**
     * Native name: htmlMediaNetworkStateIdle
     * @type {Integer (Int32)}
     */
    static Idle => 1

    /**
     * Native name: htmlMediaNetworkStateLoading
     * @type {Integer (Int32)}
     */
    static Loading => 2

    /**
     * Native name: htmlMediaNetworkStateNoSource
     * @type {Integer (Int32)}
     */
    static NoSource => 3

    /**
     * Native name: htmlMediaNetworkState_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
