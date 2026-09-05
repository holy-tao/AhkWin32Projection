#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about a safer application that is being blocked.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_saferappblocked
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_SAFERAPPBLOCKED extends Win32Enum {

    /**
     * The time stamp for the blocked application.
     * Native name: WPC_ARGS_SAFERAPPBLOCKED_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static TIMESTAMP => 0

    /**
     * The user identifier of the blocked application.
     * Native name: WPC_ARGS_SAFERAPPBLOCKED_USERID
     * @type {Integer (Int32)}
     */
    static USERID => 1

    /**
     * The location of the blocked application.
     * Native name: WPC_ARGS_SAFERAPPBLOCKED_PATH
     * @type {Integer (Int32)}
     */
    static PATH => 2

    /**
     * The rule identifier of the blocked application.
     * Native name: WPC_ARGS_SAFERAPPBLOCKED_RULEID
     * @type {Integer (Int32)}
     */
    static RULEID => 3

    /**
     * The arguments of the blocked application.
     * Native name: WPC_ARGS_SAFERAPPBLOCKED_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 4
}
