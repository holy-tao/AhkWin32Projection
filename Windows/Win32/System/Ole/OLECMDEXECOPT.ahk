#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies command execution options.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/ne-docobj-olecmdexecopt
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMDEXECOPT extends Win32Enum{

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
