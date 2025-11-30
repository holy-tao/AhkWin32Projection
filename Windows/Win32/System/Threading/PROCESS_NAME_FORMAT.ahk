#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_NAME_FORMAT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_NAME_WIN32 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_NAME_NATIVE => 1
}
