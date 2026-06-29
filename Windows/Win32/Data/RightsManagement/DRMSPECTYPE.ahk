#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRMSPECTYPE enumeration indicates what type of security or library providers are used.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmspectype
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRMSPECTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Currently not supported.
     * @type {Integer (Int32)}
     */
    static DRMSPECTYPE_UNKNOWN => 0

    /**
     * File name.
     * @type {Integer (Int32)}
     */
    static DRMSPECTYPE_FILENAME => 1
}
