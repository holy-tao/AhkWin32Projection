#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether markup compatibility detection must be run before signing.
 * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_flags
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_SIGN_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The system will check for any markup compatibility elements before 
     * signing the package. If any markup compatibility elements are found, the signing operation 
     * fails with an <b>XPS_E_MARKUP_COMPATIBILITY_ELEMENTS</b> error.
     * @type {Integer (Int32)}
     */
    static XPS_SIGN_FLAGS_NONE => 0

    /**
     * The system will not check for any markup compatibility elements before 
     * signing the package.
     * @type {Integer (Int32)}
     */
    static XPS_SIGN_FLAGS_IGNORE_MARKUP_COMPATIBILITY => 1
}
