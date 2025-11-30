#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class GAMESTATS_OPEN_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GAMESTATS_OPEN_OPENORCREATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static GAMESTATS_OPEN_OPENONLY => 1
}
