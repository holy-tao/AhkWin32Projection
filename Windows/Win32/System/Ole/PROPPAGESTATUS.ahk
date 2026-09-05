#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class PROPPAGESTATUS extends Win32Enum {

    /**
     * Native name: PROPPAGESTATUS_DIRTY
     * @type {Integer (Int32)}
     */
    static DIRTY => 1

    /**
     * Native name: PROPPAGESTATUS_VALIDATE
     * @type {Integer (Int32)}
     */
    static VALIDATE => 2

    /**
     * Native name: PROPPAGESTATUS_CLEAN
     * @type {Integer (Int32)}
     */
    static CLEAN => 4
}
