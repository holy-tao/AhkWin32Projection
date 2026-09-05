#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class TARGET_PATCH_STATE extends Win32Enum {

    /**
     * Native name: TARGET_PATCH_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: TARGET_PATCH_NOT_STARTED
     * @type {Integer (Int32)}
     */
    static NOT_STARTED => 1

    /**
     * Native name: TARGET_PATCH_IN_PROGRESS
     * @type {Integer (Int32)}
     */
    static IN_PROGRESS => 2

    /**
     * Native name: TARGET_PATCH_COMPLETED
     * @type {Integer (Int32)}
     */
    static COMPLETED => 3

    /**
     * Native name: TARGET_PATCH_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 4
}
