#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies NLS function capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/winnls/ne-winnls-sysnls_function
 * @namespace Windows.Win32.Globalization
 */
export default struct SYSNLS_FUNCTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Value indicating comparison of two strings in the manner of the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-comparestringw">CompareString</a> function or <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-lcmapstringa">LCMapString</a> with the LCMAP_SORTKEY flag specified.
     * @type {Integer (Int32)}
     */
    static COMPARE_STRING => 1
}
