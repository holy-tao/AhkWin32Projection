#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class MM_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: MM_ADDSEPARATOR
     * @type {Integer (UInt32)}
     */
    static ADDSEPARATOR => 1

    /**
     * Native name: MM_SUBMENUSHAVEIDS
     * @type {Integer (UInt32)}
     */
    static SUBMENUSHAVEIDS => 2

    /**
     * Native name: MM_DONTREMOVESEPS
     * @type {Integer (UInt32)}
     */
    static DONTREMOVESEPS => 4
}
