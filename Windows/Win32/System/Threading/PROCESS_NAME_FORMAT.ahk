#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class PROCESS_NAME_FORMAT extends Win32Enum {

    /**
     * Native name: PROCESS_NAME_WIN32
     * @type {Integer (UInt32)}
     */
    static WIN32 => 0

    /**
     * Native name: PROCESS_NAME_NATIVE
     * @type {Integer (UInt32)}
     */
    static NATIVE => 1
}
