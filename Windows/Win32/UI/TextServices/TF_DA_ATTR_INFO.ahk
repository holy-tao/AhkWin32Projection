#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TF_DA_ATTR_INFO enumeration are used to specify text conversion data in the TF_DISPLAYATTRIBUTE structure.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_attr_info
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_DA_ATTR_INFO extends Win32Enum{

    /**
     * The text is entered by the user and has not been converted yet.
     * @type {Integer (Int32)}
     */
    static TF_ATTR_INPUT => 0

    /**
     * The user has made a character selection and the text has been converted yet.
     * @type {Integer (Int32)}
     */
    static TF_ATTR_TARGET_CONVERTED => 1

    /**
     * The text is converted.
     * @type {Integer (Int32)}
     */
    static TF_ATTR_CONVERTED => 2

    /**
     * The user made a character selection, but the text is not converted yet.
     * @type {Integer (Int32)}
     */
    static TF_ATTR_TARGET_NOTCONVERTED => 3

    /**
     * The text is an error character and cannot be converted. For example, some consonants cannot be put together.
     * @type {Integer (Int32)}
     */
    static TF_ATTR_INPUT_ERROR => 4

    /**
     * The text is not converted. Theses characters will no longer be converted.
     * @type {Integer (Int32)}
     */
    static TF_ATTR_FIXEDCONVERTED => 5

    /**
     * Reserved for the system.
     * @type {Integer (Int32)}
     */
    static TF_ATTR_OTHER => -1
}
