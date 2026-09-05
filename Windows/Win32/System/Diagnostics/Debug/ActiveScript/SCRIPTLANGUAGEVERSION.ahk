#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class SCRIPTLANGUAGEVERSION extends Win32Enum {

    /**
     * Native name: SCRIPTLANGUAGEVERSION_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: SCRIPTLANGUAGEVERSION_5_7
     * @type {Integer (Int32)}
     */
    static 5_7 => 1

    /**
     * Native name: SCRIPTLANGUAGEVERSION_5_8
     * @type {Integer (Int32)}
     */
    static 5_8 => 2

    /**
     * Native name: SCRIPTLANGUAGEVERSION_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 255
}
