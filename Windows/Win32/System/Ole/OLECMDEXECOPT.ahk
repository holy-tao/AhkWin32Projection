#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies command execution options.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-olecmdexecopt
 * @namespace Windows.Win32.System.Ole
 */
class OLECMDEXECOPT extends Win32Enum {

    /**
     * Prompt the user for input or not, whichever is the default behavior.
     * Native name: OLECMDEXECOPT_DODEFAULT
     * @type {Integer (Int32)}
     */
    static DODEFAULT => 0

    /**
     * Execute the command after obtaining user input.
     * Native name: OLECMDEXECOPT_PROMPTUSER
     * @type {Integer (Int32)}
     */
    static PROMPTUSER => 1

    /**
     * Execute the command without prompting the user. For example, clicking the Print toolbar button causes a document to be immediately printed without user input.
     * Native name: OLECMDEXECOPT_DONTPROMPTUSER
     * @type {Integer (Int32)}
     */
    static DONTPROMPTUSER => 2

    /**
     * Show help for the corresponding command, but do not execute.
     * Native name: OLECMDEXECOPT_SHOWHELP
     * @type {Integer (Int32)}
     */
    static SHOWHELP => 3
}
