#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_AFFINITY_AUTO_UPDATE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_AFFINITY_DISABLE_AUTO_UPDATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_AFFINITY_ENABLE_AUTO_UPDATE => 1
}
