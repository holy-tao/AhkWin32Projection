#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class PROCESS_DEP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PROCESS_DEP_ENABLE
     * @type {Integer (UInt32)}
     */
    static ENABLE => 1

    /**
     * Native name: PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION
     * @type {Integer (UInt32)}
     */
    static DISABLE_ATL_THUNK_EMULATION => 2

    /**
     * Native name: PROCESS_DEP_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0
}
