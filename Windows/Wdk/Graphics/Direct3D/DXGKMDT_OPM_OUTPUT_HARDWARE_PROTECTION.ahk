#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_OUTPUT_HARDWARE_PROTECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_OUTPUT_HARDWARE_PROTECTION_NOT_SUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_OUTPUT_HARDWARE_PROTECTION_SUPPORTED => 1
}
