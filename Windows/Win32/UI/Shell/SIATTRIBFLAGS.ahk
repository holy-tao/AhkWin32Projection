#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SIATTRIBFLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_AND => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_OR => 2

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_APPCOMPAT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_MASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_ALLITEMS => 16384
}
