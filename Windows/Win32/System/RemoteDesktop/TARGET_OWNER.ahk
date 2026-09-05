#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class TARGET_OWNER extends Win32Enum {

    /**
     * Native name: OWNER_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: OWNER_MS_TS_PLUGIN
     * @type {Integer (Int32)}
     */
    static MS_TS_PLUGIN => 1

    /**
     * Native name: OWNER_MS_VM_PLUGIN
     * @type {Integer (Int32)}
     */
    static MS_VM_PLUGIN => 2
}
