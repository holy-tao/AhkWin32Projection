#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used with the MIMEAssociationDialog function to determine how it executes.
 * @remarks
 * An application is registered only if this flag is set and the user indicates that a persistent association is to be made.
 * @see https://learn.microsoft.com/windows/win32/api/intshcut/ne-intshcut-mimeassociationdialog_in_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class MIMEASSOCIATIONDIALOG_IN_FLAGS{

    /**
     * If this bit is set, the selected application is registered as the handler for the given MIME type. If this bit is clear, no association is registered.
     * @type {Integer (Int32)}
     */
    static MIMEASSOCDLG_FL_REGISTER_ASSOC => 1
}
