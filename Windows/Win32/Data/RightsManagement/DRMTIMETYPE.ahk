#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRMTIMETYPE enumeration specifies a time type.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmtimetype
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRMTIMETYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Greenwich Mean Time (Universal Time).
     * @type {Integer (Int32)}
     */
    static DRMTIMETYPE_SYSTEMUTC => 0

    /**
     * Local time.
     * @type {Integer (Int32)}
     */
    static DRMTIMETYPE_SYSTEMLOCAL => 1
}
