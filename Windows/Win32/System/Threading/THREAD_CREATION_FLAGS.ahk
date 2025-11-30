#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class THREAD_CREATION_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_CREATE_RUN_IMMEDIATELY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_CREATE_SUSPENDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STACK_SIZE_PARAM_IS_A_RESERVATION => 65536
}
