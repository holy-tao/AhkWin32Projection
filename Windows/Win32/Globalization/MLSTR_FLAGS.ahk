#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class MLSTR_FLAGS extends Win32Enum {

    /**
     * Native name: MLSTR_READ
     * @type {Integer (Int32)}
     */
    static READ => 1

    /**
     * Native name: MLSTR_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 2
}
