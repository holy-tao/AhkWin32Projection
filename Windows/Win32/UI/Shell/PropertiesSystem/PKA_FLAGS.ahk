#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes property change array behavior.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/ne-propsys-pka_flags
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
class PKA_FLAGS extends Win32BitflagEnum {

    /**
     * Replace current value.
     * Native name: PKA_SET
     * @type {Integer (Int32)}
     */
    static SET => 0

    /**
     * Append to current value - multi-value properties only.
     * Native name: PKA_APPEND
     * @type {Integer (Int32)}
     */
    static APPEND => 1

    /**
     * Delete from current value - multi-value properties only.
     * Native name: PKA_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 2
}
