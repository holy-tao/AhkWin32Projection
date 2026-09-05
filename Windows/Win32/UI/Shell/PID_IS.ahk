#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class PID_IS extends Win32Enum {

    /**
     * Native name: PID_IS_URL
     * @type {Integer (Int32)}
     */
    static URL => 2

    /**
     * Native name: PID_IS_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 4

    /**
     * Native name: PID_IS_WORKINGDIR
     * @type {Integer (Int32)}
     */
    static WORKINGDIR => 5

    /**
     * Native name: PID_IS_HOTKEY
     * @type {Integer (Int32)}
     */
    static HOTKEY => 6

    /**
     * Native name: PID_IS_SHOWCMD
     * @type {Integer (Int32)}
     */
    static SHOWCMD => 7

    /**
     * Native name: PID_IS_ICONINDEX
     * @type {Integer (Int32)}
     */
    static ICONINDEX => 8

    /**
     * Native name: PID_IS_ICONFILE
     * @type {Integer (Int32)}
     */
    static ICONFILE => 9

    /**
     * Native name: PID_IS_WHATSNEW
     * @type {Integer (Int32)}
     */
    static WHATSNEW => 10

    /**
     * Native name: PID_IS_AUTHOR
     * @type {Integer (Int32)}
     */
    static AUTHOR => 11

    /**
     * Native name: PID_IS_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 12

    /**
     * Native name: PID_IS_COMMENT
     * @type {Integer (Int32)}
     */
    static COMMENT => 13

    /**
     * Native name: PID_IS_ROAMED
     * @type {Integer (Int32)}
     */
    static ROAMED => 15
}
