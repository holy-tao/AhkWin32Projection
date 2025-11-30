#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_DEP_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_DEP_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_DEP_NONE => 0
}
