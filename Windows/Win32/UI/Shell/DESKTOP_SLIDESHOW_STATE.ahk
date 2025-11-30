#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DESKTOP_SLIDESHOW_STATE extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static DSS_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DSS_SLIDESHOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static DSS_DISABLED_BY_REMOTE_SESSION => 4
}
