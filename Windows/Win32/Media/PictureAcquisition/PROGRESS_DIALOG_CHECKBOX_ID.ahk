#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PROGRESS_DIALOG_CHECKBOX_ID enumeration type indicates the check box on the IPhotoProgressDialog object.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/ne-photoacquire-progress_dialog_checkbox_id
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct PROGRESS_DIALOG_CHECKBOX_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies PROGRESS_DIALOG_CHECKBOX_ID_DEFAULT .
     * @type {Integer (Int32)}
     */
    static PROGRESS_DIALOG_CHECKBOX_ID_DEFAULT => 0
}
