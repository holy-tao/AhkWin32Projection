#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the state of the dialog box option on whether to save credentials.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialsaveoption
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class CredentialSaveOption extends Win32Enum{

    /**
     * The "Save credentials?" dialog box is not selected, indicating that the user doesn't want their credentials saved.
     * @type {Integer (Int32)}
     */
    static Unselected => 0

    /**
     * The "Save credentials?" dialog box is selected, indicating that the user wants their credentials saved.
     * @type {Integer (Int32)}
     */
    static Selected => 1

    /**
     * The "Save credentials?" dialog box is not displayed at all.
     * @type {Integer (Int32)}
     */
    static Hidden => 2
}
