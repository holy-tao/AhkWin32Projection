#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ATF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ATF_TIMEOUTON
     * @type {Integer (UInt32)}
     */
    static TIMEOUTON => 1

    /**
     * Native name: ATF_ONOFFFEEDBACK
     * @type {Integer (UInt32)}
     */
    static ONOFFFEEDBACK => 2
}
