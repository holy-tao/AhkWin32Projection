#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_OPERATION_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationOptionNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationOptionProgressUpdate => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationOptionReserved1 => 2
}
