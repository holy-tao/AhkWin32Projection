#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CLS_IOSTATS_CLASS extends Win32Enum {

    /**
     * Native name: ClsIoStatsDefault
     * @type {Integer (Int32)}
     */
    static IoStatsDefault => 0

    /**
     * Native name: ClsIoStatsMax
     * @type {Integer (Int32)}
     */
    static IoStatsMax => 65535
}
