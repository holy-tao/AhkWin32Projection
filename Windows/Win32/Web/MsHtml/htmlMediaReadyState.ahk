#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMediaReadyState extends Win32Enum {

    /**
     * Native name: htmlMediaReadyStateHaveNothing
     * @type {Integer (Int32)}
     */
    static HaveNothing => 0

    /**
     * Native name: htmlMediaReadyStateHaveMetadata
     * @type {Integer (Int32)}
     */
    static HaveMetadata => 1

    /**
     * Native name: htmlMediaReadyStateHaveCurrentData
     * @type {Integer (Int32)}
     */
    static HaveCurrentData => 2

    /**
     * Native name: htmlMediaReadyStateHaveFutureData
     * @type {Integer (Int32)}
     */
    static HaveFutureData => 3

    /**
     * Native name: htmlMediaReadyStateHaveEnoughData
     * @type {Integer (Int32)}
     */
    static HaveEnoughData => 4

    /**
     * Native name: htmlMediaReadyState_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
