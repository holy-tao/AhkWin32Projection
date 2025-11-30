#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PID_IS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_URL => 2

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_NAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_WORKINGDIR => 5

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_HOTKEY => 6

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_SHOWCMD => 7

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_ICONINDEX => 8

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_ICONFILE => 9

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_WHATSNEW => 10

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_AUTHOR => 11

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_DESCRIPTION => 12

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_COMMENT => 13

    /**
     * @type {Integer (Int32)}
     */
    static PID_IS_ROAMED => 15
}
