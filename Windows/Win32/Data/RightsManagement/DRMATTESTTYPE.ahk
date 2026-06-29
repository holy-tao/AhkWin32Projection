#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRMATTESTTYPE enumeration specifies what kind of signature to create for a data blob.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmattesttype
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRMATTESTTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Create a signature using full environment information.
     * @type {Integer (Int32)}
     */
    static DRMATTESTTYPE_FULLENVIRONMENT => 0

    /**
     * Create a signature using only a hash of the environment.
     * @type {Integer (Int32)}
     */
    static DRMATTESTTYPE_HASHONLY => 1
}
