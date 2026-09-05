#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class FTP_PROCESS_STATUS extends Win32Enum {

    /**
     * Native name: FTP_PROCESS_CONTINUE
     * @type {Integer (Int32)}
     */
    static CONTINUE => 0

    /**
     * Native name: FTP_PROCESS_CLOSE_SESSION
     * @type {Integer (Int32)}
     */
    static CLOSE_SESSION => 1

    /**
     * Native name: FTP_PROCESS_TERMINATE_SESSION
     * @type {Integer (Int32)}
     */
    static TERMINATE_SESSION => 2

    /**
     * Native name: FTP_PROCESS_REJECT_COMMAND
     * @type {Integer (Int32)}
     */
    static REJECT_COMMAND => 3
}
