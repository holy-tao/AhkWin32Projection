#Requires AutoHotkey v2.0.0 64-bit

/**
 * The URLASSOCIATIONDIALOG_IN_FLAGS enumerated values are used with URLAssociationDialog to determine how it executes.
 * @see https://learn.microsoft.com/windows/win32/api/intshcut/ne-intshcut-urlassociationdialog_in_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class URLASSOCIATIONDIALOG_IN_FLAGS{

    /**
     * Use the default file name (that is, "Internet Shortcut").
     * @type {Integer (Int32)}
     */
    static URLASSOCDLG_FL_USE_DEFAULT_NAME => 1

    /**
     * Register the selected application as the handler for the protocol specified in the <i>pcszURL</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/intshcut/nf-intshcut-urlassociationdialoga">URLAssociationDialog</a>. The application is registered only if this flag is set and the user indicates that a persistent association is desired.
     * @type {Integer (Int32)}
     */
    static URLASSOCDLG_FL_REGISTER_ASSOC => 2
}
