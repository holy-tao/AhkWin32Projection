#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines the type of COM security descriptor to get when calling CoGetSystemSecurityPermissions.
 * @see https://learn.microsoft.com/windows/win32/api/objbase/ne-objbase-comsd
 * @namespace Windows.Win32.System.Com
 */
export default struct COMSD {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Machine-wide launch permissions.
     * @type {Integer (Int32)}
     */
    static SD_LAUNCHPERMISSIONS => 0

    /**
     * Machine-wide access permissions.
     * @type {Integer (Int32)}
     */
    static SD_ACCESSPERMISSIONS => 1

    /**
     * Machine-wide launch limits.
     * @type {Integer (Int32)}
     */
    static SD_LAUNCHRESTRICTIONS => 2

    /**
     * Machine-wide access limits.
     * @type {Integer (Int32)}
     */
    static SD_ACCESSRESTRICTIONS => 3
}
