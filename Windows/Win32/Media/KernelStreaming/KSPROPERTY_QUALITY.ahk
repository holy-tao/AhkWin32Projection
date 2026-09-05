#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_QUALITY extends Win32Enum {

    /**
     * Native name: KSPROPERTY_QUALITY_REPORT
     * @type {Integer (Int32)}
     */
    static REPORT => 0

    /**
     * Native name: KSPROPERTY_QUALITY_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 1
}
