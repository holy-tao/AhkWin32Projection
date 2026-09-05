#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Gaming
 */
class GAMESTATS_OPEN_TYPE extends Win32Enum {

    /**
     * Native name: GAMESTATS_OPEN_OPENORCREATE
     * @type {Integer (Int32)}
     */
    static OPENORCREATE => 0

    /**
     * Native name: GAMESTATS_OPEN_OPENONLY
     * @type {Integer (Int32)}
     */
    static OPENONLY => 1
}
