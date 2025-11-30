#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManShellFlag extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_NO_COMPRESSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_DELETE_SERVER_SESSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_SERVER_BUFFERING_MODE_DROP => 4

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_SERVER_BUFFERING_MODE_BLOCK => 8

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_RECEIVE_DELAY_OUTPUT_STREAM => 16
}
