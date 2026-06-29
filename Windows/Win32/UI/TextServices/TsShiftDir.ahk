#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Elements of the TsShiftDir enumeration specify which direction an anchor is moved.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ne-textstor-tsshiftdir
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TsShiftDir {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
