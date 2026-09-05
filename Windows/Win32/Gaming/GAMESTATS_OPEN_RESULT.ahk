#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Gaming
 */
class GAMESTATS_OPEN_RESULT extends Win32Enum {

    /**
     * Native name: GAMESTATS_OPEN_CREATED
     * @type {Integer (Int32)}
     */
    static CREATED => 0

    /**
     * Native name: GAMESTATS_OPEN_OPENED
     * @type {Integer (Int32)}
     */
    static OPENED => 1
}
