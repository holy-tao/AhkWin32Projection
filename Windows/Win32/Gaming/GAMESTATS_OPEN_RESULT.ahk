#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class GAMESTATS_OPEN_RESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GAMESTATS_OPEN_CREATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static GAMESTATS_OPEN_OPENED => 1
}
