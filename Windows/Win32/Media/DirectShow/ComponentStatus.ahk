#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class ComponentStatus extends Win32Enum {

    /**
     * Native name: StatusActive
     * @type {Integer (Int32)}
     */
    static Active => 0

    /**
     * Native name: StatusInactive
     * @type {Integer (Int32)}
     */
    static Inactive => 1

    /**
     * Native name: StatusUnavailable
     * @type {Integer (Int32)}
     */
    static Unavailable => 2
}
