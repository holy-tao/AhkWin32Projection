#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of key to be returned by IQueryAssociations::GetKey.
 * @see https://docs.microsoft.com/windows/win32/api//shlwapi/ne-shlwapi-assockey
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ASSOCKEY extends Win32Enum{

    /**
     * A key that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> through a <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/ns-shellapi-shellexecuteinfoa">SHELLEXECUTEINFO</a> structure.
     * @type {Integer (Int32)}
     */
    static ASSOCKEY_SHELLEXECCLASS => 1

    /**
     * An <b>Application</b> key for the file type.
     * @type {Integer (Int32)}
     */
    static ASSOCKEY_APP => 2

    /**
     * A ProgID or class key.
     * @type {Integer (Int32)}
     */
    static ASSOCKEY_CLASS => 3

    /**
     * A BaseClass value.
     * @type {Integer (Int32)}
     */
    static ASSOCKEY_BASECLASS => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ASSOCKEY_MAX => 5
}
