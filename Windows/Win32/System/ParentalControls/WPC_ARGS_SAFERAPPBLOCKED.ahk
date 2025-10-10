#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about a safer application that is being blocked.
 * @see https://docs.microsoft.com/windows/win32/api//wpcevent/ne-wpcevent-wpc_args_saferappblocked
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_SAFERAPPBLOCKED{

    /**
     * The time stamp for the blocked application.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SAFERAPPBLOCKED_TIMESTAMP => 0

    /**
     * The user identifier of the blocked application.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SAFERAPPBLOCKED_USERID => 1

    /**
     * The location of the blocked application.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SAFERAPPBLOCKED_PATH => 2

    /**
     * The rule identifier of the blocked application.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SAFERAPPBLOCKED_RULEID => 3

    /**
     * The arguments of the blocked application.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SAFERAPPBLOCKED_CARGS => 4
}
