#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
class GPO_OPTIONS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_OPTION_DISABLE_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_OPTION_DISABLE_MACHINE => 2
}
