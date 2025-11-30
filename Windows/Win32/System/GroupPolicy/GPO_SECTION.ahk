#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPO_SECTION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_SECTION_ROOT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_SECTION_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_SECTION_MACHINE => 2
}
