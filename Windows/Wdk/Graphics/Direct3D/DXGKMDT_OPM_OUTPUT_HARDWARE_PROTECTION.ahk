#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_OUTPUT_HARDWARE_PROTECTION extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_OUTPUT_HARDWARE_PROTECTION_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 0

    /**
     * Native name: DXGKMDT_OPM_OUTPUT_HARDWARE_PROTECTION_SUPPORTED
     * @type {Integer (Int32)}
     */
    static SUPPORTED => 1
}
