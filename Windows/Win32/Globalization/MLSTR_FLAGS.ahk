#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MLSTR_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MLSTR_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static MLSTR_WRITE => 2
}
