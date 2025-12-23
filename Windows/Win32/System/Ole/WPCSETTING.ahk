#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class WPCSETTING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPCSETTING_LOGGING_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPCSETTING_FILEDOWNLOAD_BLOCKED => 2
}
