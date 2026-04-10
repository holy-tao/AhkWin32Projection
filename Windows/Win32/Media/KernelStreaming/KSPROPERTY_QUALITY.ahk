#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_QUALITY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_QUALITY_REPORT => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_QUALITY_ERROR => 1
}
