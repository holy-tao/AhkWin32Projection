#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLECONTROL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
