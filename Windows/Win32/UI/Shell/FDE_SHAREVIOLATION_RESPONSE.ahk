#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the values used by the IFileDialogEvents::OnShareViolation method to indicate an application's response to a sharing violation that occurs when a file is opened or saved.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fde_shareviolation_response
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FDE_SHAREVIOLATION_RESPONSE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The application has not handled the event. The dialog displays a UI that indicates that the file is in use and a different file must be chosen.
     * @type {Integer (Int32)}
     */
    static FDESVR_DEFAULT => 0

    /**
     * The application has determined that the file should be returned from the dialog.
     * @type {Integer (Int32)}
     */
    static FDESVR_ACCEPT => 1

    /**
     * The application has determined that the file should not be returned from the dialog.
     * @type {Integer (Int32)}
     */
    static FDESVR_REFUSE => 2
}
