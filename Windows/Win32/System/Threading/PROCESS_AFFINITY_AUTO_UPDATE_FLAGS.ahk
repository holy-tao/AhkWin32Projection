#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class PROCESS_AFFINITY_AUTO_UPDATE_FLAGS extends Win32Enum {

    /**
     * Native name: PROCESS_AFFINITY_DISABLE_AUTO_UPDATE
     * @type {Integer (UInt32)}
     */
    static DISABLE_AUTO_UPDATE => 0

    /**
     * Native name: PROCESS_AFFINITY_ENABLE_AUTO_UPDATE
     * @type {Integer (UInt32)}
     */
    static ENABLE_AUTO_UPDATE => 1
}
