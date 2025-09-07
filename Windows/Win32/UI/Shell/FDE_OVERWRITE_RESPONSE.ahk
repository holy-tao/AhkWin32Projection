#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the values used by the IFileDialogEvents::OnOverwrite method to indicate an application's response to an overwrite request during a save operation using the common file dialog.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fde_overwrite_response
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FDE_OVERWRITE_RESPONSE{

    /**
     * The application has not handled the event. The dialog displays a UI asking the user whether the file should be overwritten and returned from the dialog.
     * @type {Integer (Int32)}
     */
    static FDEOR_DEFAULT => 0

    /**
     * The application has determined that the file should be returned from the dialog.
     * @type {Integer (Int32)}
     */
    static FDEOR_ACCEPT => 1

    /**
     * The application has determined that the file should not be returned from the dialog.
     * @type {Integer (Int32)}
     */
    static FDEOR_REFUSE => 2
}
