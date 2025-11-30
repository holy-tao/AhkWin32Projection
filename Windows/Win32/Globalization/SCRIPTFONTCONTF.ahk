#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPTFONTCONTF extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_FIXED_FONT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_PROPORTIONAL_FONT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_SCRIPT_USER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_SCRIPT_HIDE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_SCRIPT_SYSTEM => 262144
}
