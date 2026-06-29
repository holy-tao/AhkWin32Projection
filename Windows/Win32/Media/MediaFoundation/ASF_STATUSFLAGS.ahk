#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines status conditions for the IMFASFSplitter::GetNextSample method.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-asf_statusflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ASF_STATUSFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The operation is incomplete.
     * @type {Integer (Int32)}
     */
    static ASF_STATUSFLAGS_INCOMPLETE => 1

    /**
     * One or more non-critical errors
     *         occurred while parsing the ASF data.
     * @type {Integer (Int32)}
     */
    static ASF_STATUSFLAGS_NONFATAL_ERROR => 2
}
