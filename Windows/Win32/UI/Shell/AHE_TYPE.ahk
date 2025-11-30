#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class AHE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AHE_DESKTOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static AHE_IMMERSIVE => 1
}
