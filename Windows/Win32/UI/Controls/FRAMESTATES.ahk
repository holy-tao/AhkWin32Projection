#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class FRAMESTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FS_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FS_INACTIVE => 2
}
