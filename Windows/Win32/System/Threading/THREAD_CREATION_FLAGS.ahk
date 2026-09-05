#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class THREAD_CREATION_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: THREAD_CREATE_RUN_IMMEDIATELY
     * @type {Integer (UInt32)}
     */
    static CREATE_RUN_IMMEDIATELY => 0

    /**
     * Native name: THREAD_CREATE_SUSPENDED
     * @type {Integer (UInt32)}
     */
    static CREATE_SUSPENDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STACK_SIZE_PARAM_IS_A_RESERVATION => 65536
}
