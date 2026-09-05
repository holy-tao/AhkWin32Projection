#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The USER_INPUT_STRING_TYPE enumeration type indicates the type of string to obtain from the user in IPhotoAcquireProgressCB::GetUserInput.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/ne-photoacquire-user_input_string_type
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
class USER_INPUT_STRING_TYPE extends Win32Enum {

    /**
     * Indicates that any string is allowed.
     * Native name: USER_INPUT_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Indicates that the string will not accept characters that are illegal in file or directory names (such as * or /).
     * Native name: USER_INPUT_PATH_ELEMENT
     * @type {Integer (Int32)}
     */
    static PATH_ELEMENT => 1
}
