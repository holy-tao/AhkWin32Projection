#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class AHE_TYPE extends Win32Enum {

    /**
     * Native name: AHE_DESKTOP
     * @type {Integer (Int32)}
     */
    static DESKTOP => 0

    /**
     * Native name: AHE_IMMERSIVE
     * @type {Integer (Int32)}
     */
    static IMMERSIVE => 1
}
