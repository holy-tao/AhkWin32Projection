#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CLS_IOSTATS_CLASS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ClsIoStatsDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClsIoStatsMax => 65535
}
