#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPO_OPEN_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_OPEN_LOAD_REGISTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_OPEN_READ_ONLY => 2
}
