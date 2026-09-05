#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class CLR_DEBUGGING_PROCESS_FLAGS extends Win32Enum {

    /**
     * Native name: CLR_DEBUGGING_MANAGED_EVENT_PENDING
     * @type {Integer (Int32)}
     */
    static MANAGED_EVENT_PENDING => 1

    /**
     * Native name: CLR_DEBUGGING_MANAGED_EVENT_DEBUGGER_LAUNCH
     * @type {Integer (Int32)}
     */
    static MANAGED_EVENT_DEBUGGER_LAUNCH => 2
}
