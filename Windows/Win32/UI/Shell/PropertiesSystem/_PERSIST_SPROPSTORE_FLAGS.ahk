#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class _PERSIST_SPROPSTORE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FPSPS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static FPSPS_READONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static FPSPS_TREAT_NEW_VALUES_AS_DIRTY => 2
}
