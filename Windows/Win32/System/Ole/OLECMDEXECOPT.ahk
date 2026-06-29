#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies command execution options.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-olecmdexecopt
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLECMDEXECOPT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Prompt the user for input or not, whichever is the default behavior.
     * @type {Integer (Int32)}
     */
    static OLECMDEXECOPT_DODEFAULT => 0

    /**
     * Execute the command after obtaining user input.
     * @type {Integer (Int32)}
     */
    static OLECMDEXECOPT_PROMPTUSER => 1

    /**
     * Execute the command without prompting the user. For example, clicking the Print toolbar button causes a document to be immediately printed without user input.
     * @type {Integer (Int32)}
     */
    static OLECMDEXECOPT_DONTPROMPTUSER => 2

    /**
     * Show help for the corresponding command, but do not execute.
     * @type {Integer (Int32)}
     */
    static OLECMDEXECOPT_SHOWHELP => 3
}
