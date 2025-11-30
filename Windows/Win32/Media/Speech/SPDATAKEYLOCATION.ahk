#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPDATAKEYLOCATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPDKL_DefaultLocation => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPDKL_CurrentUser => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPDKL_LocalMachine => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPDKL_CurrentConfig => 5
}
