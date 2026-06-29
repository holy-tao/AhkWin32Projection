#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * These flags are associated with certain PROPVARIANT structure comparisons.
 * @see https://learn.microsoft.com/windows/win32/api/propvarutil/ne-propvarutil-propvar_compare_unit
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct PROPVAR_COMPARE_UNIT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The default unit.
     * @type {Integer (Int32)}
     */
    static PVCU_DEFAULT => 0

    /**
     * The second comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_SECOND => 1

    /**
     * The minute comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_MINUTE => 2

    /**
     * The hour comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_HOUR => 3

    /**
     * The day comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_DAY => 4

    /**
     * The month comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_MONTH => 5

    /**
     * The year comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_YEAR => 6
}
