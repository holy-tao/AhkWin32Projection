#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_INPUT_STRING_TYPE enumeration type indicates the type of string to obtain from the user in IPhotoAcquireProgressCB::GetUserInput.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/ne-photoacquire-user_input_string_type
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct USER_INPUT_STRING_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that any string is allowed.
     * @type {Integer (Int32)}
     */
    static USER_INPUT_DEFAULT => 0

    /**
     * Indicates that the string will not accept characters that are illegal in file or directory names (such as * or /).
     * @type {Integer (Int32)}
     */
    static USER_INPUT_PATH_ELEMENT => 1
}
