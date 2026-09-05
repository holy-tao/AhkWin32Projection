#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsOpreqCommand extends Win32Enum {

    /**
     * Native name: NTMS_OPREQ_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: NTMS_OPREQ_NEWMEDIA
     * @type {Integer (Int32)}
     */
    static NEWMEDIA => 1

    /**
     * Native name: NTMS_OPREQ_CLEANER
     * @type {Integer (Int32)}
     */
    static CLEANER => 2

    /**
     * Native name: NTMS_OPREQ_DEVICESERVICE
     * @type {Integer (Int32)}
     */
    static DEVICESERVICE => 3

    /**
     * Native name: NTMS_OPREQ_MOVEMEDIA
     * @type {Integer (Int32)}
     */
    static MOVEMEDIA => 4

    /**
     * Native name: NTMS_OPREQ_MESSAGE
     * @type {Integer (Int32)}
     */
    static MESSAGE => 5
}
