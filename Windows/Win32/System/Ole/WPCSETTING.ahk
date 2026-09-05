#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class WPCSETTING extends Win32Enum {

    /**
     * Native name: WPCSETTING_LOGGING_ENABLED
     * @type {Integer (Int32)}
     */
    static LOGGING_ENABLED => 1

    /**
     * Native name: WPCSETTING_FILEDOWNLOAD_BLOCKED
     * @type {Integer (Int32)}
     */
    static FILEDOWNLOAD_BLOCKED => 2
}
