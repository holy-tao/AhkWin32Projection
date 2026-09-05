#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
class HCS_OPERATION_OPTIONS extends Win32BitflagEnum {

    /**
     * Native name: HcsOperationOptionNone
     * @type {Integer (Int32)}
     */
    static OptionNone => 0

    /**
     * Native name: HcsOperationOptionProgressUpdate
     * @type {Integer (Int32)}
     */
    static OptionProgressUpdate => 1

    /**
     * Native name: HcsOperationOptionReserved1
     * @type {Integer (Int32)}
     */
    static OptionReserved1 => 2
}
