#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ACTIVATEOPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static AO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static AO_DESIGNMODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static AO_NOERRORUI => 2

    /**
     * @type {Integer (Int32)}
     */
    static AO_NOSPLASHSCREEN => 4

    /**
     * @type {Integer (Int32)}
     */
    static AO_PRELAUNCH => 33554432
}
