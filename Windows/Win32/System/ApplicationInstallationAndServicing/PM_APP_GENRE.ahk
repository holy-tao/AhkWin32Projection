#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_APP_GENRE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_GENRE_GAMES => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_GENRE_OTHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_GENRE_INVALID => 2
}
