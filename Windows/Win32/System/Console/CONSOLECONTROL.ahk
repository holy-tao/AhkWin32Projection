#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLECONTROL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Reserved1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static ConsoleNotifyConsoleApplication => 1

    /**
     * @type {Integer (Int32)}
     */
    static Reserved2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static ConsoleSetCaretInfo => 3

    /**
     * @type {Integer (Int32)}
     */
    static Reserved3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static ConsoleSetForeground => 5

    /**
     * @type {Integer (Int32)}
     */
    static ConsoleSetWindowOwner => 6

    /**
     * @type {Integer (Int32)}
     */
    static ConsoleEndTask => 7
}
