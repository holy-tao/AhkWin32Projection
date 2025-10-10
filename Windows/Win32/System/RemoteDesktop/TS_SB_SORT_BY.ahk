#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies sort order. It is used as a parameter in the EnumerateTargets method.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/ne-sbtsv-ts_sb_sort_by
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TS_SB_SORT_BY{

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
