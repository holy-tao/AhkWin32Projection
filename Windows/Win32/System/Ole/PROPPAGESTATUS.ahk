#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PROPPAGESTATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROPPAGESTATUS_DIRTY => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROPPAGESTATUS_VALIDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROPPAGESTATUS_CLEAN => 4
}
