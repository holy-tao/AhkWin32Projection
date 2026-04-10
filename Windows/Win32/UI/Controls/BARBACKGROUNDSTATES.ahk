#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class BARBACKGROUNDSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MB_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MB_INACTIVE => 2
}
