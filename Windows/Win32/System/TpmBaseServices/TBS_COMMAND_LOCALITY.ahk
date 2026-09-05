#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 */
class TBS_COMMAND_LOCALITY extends Win32Enum {

    /**
     * Native name: TBS_COMMAND_LOCALITY_ZERO
     * @type {Integer (UInt32)}
     */
    static ZERO => 0

    /**
     * Native name: TBS_COMMAND_LOCALITY_ONE
     * @type {Integer (UInt32)}
     */
    static ONE => 1

    /**
     * Native name: TBS_COMMAND_LOCALITY_TWO
     * @type {Integer (UInt32)}
     */
    static TWO => 2

    /**
     * Native name: TBS_COMMAND_LOCALITY_THREE
     * @type {Integer (UInt32)}
     */
    static THREE => 3

    /**
     * Native name: TBS_COMMAND_LOCALITY_FOUR
     * @type {Integer (UInt32)}
     */
    static FOUR => 4
}
