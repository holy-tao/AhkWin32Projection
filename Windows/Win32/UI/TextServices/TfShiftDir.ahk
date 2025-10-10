#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TfShiftDir enumeration specify which direction a range anchor is moved.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/ne-msctf-tfshiftdir
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfShiftDir{

    /**
     * Specifies that the anchor will be moved to the region immediately preceding the range.
     * @type {Integer (Int32)}
     */
    static TF_SD_BACKWARD => 0

    /**
     * Specifies that the anchor will be moved to the region immediately following the range.
     * @type {Integer (Int32)}
     */
    static TF_SD_FORWARD => 1
}
