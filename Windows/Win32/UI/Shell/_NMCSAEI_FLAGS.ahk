#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class _NMCSAEI_FLAGS extends Win32Enum {

    /**
     * Native name: NMCSAEI_SELECT
     * @type {Integer (Int32)}
     */
    static SELECT => 0

    /**
     * Native name: NMCSAEI_EDIT
     * @type {Integer (Int32)}
     */
    static EDIT => 1
}
