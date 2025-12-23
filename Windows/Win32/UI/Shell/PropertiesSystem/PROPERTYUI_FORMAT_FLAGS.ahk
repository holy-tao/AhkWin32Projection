#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPERTYUI_FORMAT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static PUIFFDF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PUIFFDF_RIGHTTOLEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static PUIFFDF_SHORTFORMAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static PUIFFDF_NOTIME => 4

    /**
     * @type {Integer (Int32)}
     */
    static PUIFFDF_FRIENDLYDATE => 8
}
