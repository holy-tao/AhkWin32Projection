#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ACTCTX_COMPATIBILITY_ELEMENT_TYPE enumeration describes the compatibility element in the application manifest.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-actctx_compatibility_element_type
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ACTCTX_COMPATIBILITY_ELEMENT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static ACTCTX_COMPATIBILITY_ELEMENT_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACTCTX_COMPATIBILITY_ELEMENT_TYPE_OS => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MITIGATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MAXVERSIONTESTED => 3
}
