#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class RPCOPT_SERVER_LOCALITY_VALUES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SERVER_LOCALITY_PROCESS_LOCAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SERVER_LOCALITY_MACHINE_LOCAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SERVER_LOCALITY_REMOTE => 2
}
