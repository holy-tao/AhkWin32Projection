#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TsShiftDir enumeration specify which direction an anchor is moved.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/ne-textstor-tsshiftdir
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TsShiftDir{

    /**
     * Specifies that the anchor will be moved to the region immediately preceding a range of text.
     * @type {Integer (Int32)}
     */
    static TS_SD_BACKWARD => 0

    /**
     * Specifies that the anchor will be moved to the region immediately following a range of text.
     * @type {Integer (Int32)}
     */
    static TS_SD_FORWARD => 1
}
