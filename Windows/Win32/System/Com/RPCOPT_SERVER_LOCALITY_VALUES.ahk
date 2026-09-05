#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class RPCOPT_SERVER_LOCALITY_VALUES extends Win32Enum {

    /**
     * Native name: SERVER_LOCALITY_PROCESS_LOCAL
     * @type {Integer (Int32)}
     */
    static PROCESS_LOCAL => 0

    /**
     * Native name: SERVER_LOCALITY_MACHINE_LOCAL
     * @type {Integer (Int32)}
     */
    static MACHINE_LOCAL => 1

    /**
     * Native name: SERVER_LOCALITY_REMOTE
     * @type {Integer (Int32)}
     */
    static REMOTE => 2
}
