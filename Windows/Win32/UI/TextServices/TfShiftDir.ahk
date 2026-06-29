#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Elements of the TfShiftDir enumeration specify which direction a range anchor is moved.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tfshiftdir
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TfShiftDir {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
