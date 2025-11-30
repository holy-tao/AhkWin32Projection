#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes property change array behavior.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/ne-propsys-pka_flags
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PKA_FLAGS extends Win32BitflagEnum{

    /**
     * Replace current value.
     * @type {Integer (Int32)}
     */
    static PKA_SET => 0

    /**
     * Append to current value - multi-value properties only.
     * @type {Integer (Int32)}
     */
    static PKA_APPEND => 1

    /**
     * Delete from current value - multi-value properties only.
     * @type {Integer (Int32)}
     */
    static PKA_DELETE => 2
}
