#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies sort order. It is used as a parameter in the EnumerateTargets method.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/ne-sbtsv-ts_sb_sort_by
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct TS_SB_SORT_BY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not sort.
     * @type {Integer (Int32)}
     */
    static TS_SB_SORT_BY_NONE => 0

    /**
     * Sort by target name.
     * @type {Integer (Int32)}
     */
    static TS_SB_SORT_BY_NAME => 1

    /**
     * Sort by a specified property.
     * @type {Integer (Int32)}
     */
    static TS_SB_SORT_BY_PROP => 2
}
