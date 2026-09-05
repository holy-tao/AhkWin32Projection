#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
class GPO_OPEN_FLAGS extends Win32Enum {

    /**
     * Native name: GPO_OPEN_LOAD_REGISTRY
     * @type {Integer (UInt32)}
     */
    static LOAD_REGISTRY => 1

    /**
     * Native name: GPO_OPEN_READ_ONLY
     * @type {Integer (UInt32)}
     */
    static READ_ONLY => 2
}
