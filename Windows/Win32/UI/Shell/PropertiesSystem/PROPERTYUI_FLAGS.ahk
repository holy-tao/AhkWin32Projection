#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPERTYUI_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static PUIF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PUIF_RIGHTALIGN => 1

    /**
     * @type {Integer (Int32)}
     */
    static PUIF_NOLABELININFOTIP => 2
}
