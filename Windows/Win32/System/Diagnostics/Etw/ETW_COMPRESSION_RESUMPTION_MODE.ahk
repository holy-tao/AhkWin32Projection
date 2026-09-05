#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_COMPRESSION_RESUMPTION_MODE extends Win32Enum {

    /**
     * Native name: EtwCompressionModeRestart
     * @type {Integer (Int32)}
     */
    static Restart => 0

    /**
     * Native name: EtwCompressionModeNoDisable
     * @type {Integer (Int32)}
     */
    static NoDisable => 1

    /**
     * Native name: EtwCompressionModeNoRestart
     * @type {Integer (Int32)}
     */
    static NoRestart => 2
}
