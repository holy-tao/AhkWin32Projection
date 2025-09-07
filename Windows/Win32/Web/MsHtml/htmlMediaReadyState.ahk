#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlMediaReadyState{

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaReadyStateHaveNothing => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaReadyStateHaveMetadata => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaReadyStateHaveCurrentData => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaReadyStateHaveFutureData => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaReadyStateHaveEnoughData => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaReadyState_Max => 2147483647
}
