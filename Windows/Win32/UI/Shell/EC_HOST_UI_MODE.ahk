#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EC_HOST_UI_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ECHUIM_DESKTOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static ECHUIM_IMMERSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ECHUIM_SYSTEM_LAUNCHER => 2
}
