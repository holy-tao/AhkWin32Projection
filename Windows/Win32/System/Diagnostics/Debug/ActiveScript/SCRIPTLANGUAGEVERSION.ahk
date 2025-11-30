#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class SCRIPTLANGUAGEVERSION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTLANGUAGEVERSION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTLANGUAGEVERSION_5_7 => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTLANGUAGEVERSION_5_8 => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTLANGUAGEVERSION_MAX => 255
}
