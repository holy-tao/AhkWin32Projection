#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlMediaNetworkState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkStateEmpty => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkStateIdle => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkStateLoading => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkStateNoSource => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkState_Max => 2147483647
}
