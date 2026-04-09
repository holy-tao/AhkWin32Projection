#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_OUTPUT_HARDWARE_PROTECTION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static OPM_OUTPUT_HARDWARE_PROTECTION_NOT_SUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPM_OUTPUT_HARDWARE_PROTECTION_SUPPORTED => 1
}
