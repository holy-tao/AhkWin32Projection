#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of key to be returned by IQueryAssociations::GetKey.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-assockey
 * @namespace Windows.Win32.UI.Shell
 */
class ASSOCKEY extends Win32Enum {

    /**
     * A key that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> through a <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/ns-shellapi-shellexecuteinfoa">SHELLEXECUTEINFO</a> structure.
     * Native name: ASSOCKEY_SHELLEXECCLASS
     * @type {Integer (Int32)}
     */
    static SHELLEXECCLASS => 1

    /**
     * An <b>Application</b> key for the file type.
     * Native name: ASSOCKEY_APP
     * @type {Integer (Int32)}
     */
    static APP => 2

    /**
     * A ProgID or class key.
     * Native name: ASSOCKEY_CLASS
     * @type {Integer (Int32)}
     */
    static CLASS => 3

    /**
     * A BaseClass value.
     * Native name: ASSOCKEY_BASECLASS
     * @type {Integer (Int32)}
     */
    static BASECLASS => 4

    /**
     * Native name: ASSOCKEY_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 5
}
