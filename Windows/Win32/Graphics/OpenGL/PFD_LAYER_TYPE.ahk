#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class PFD_LAYER_TYPE extends Win32Enum{

    /**
     * @type {Integer (SByte)}
     */
    static PFD_UNDERLAY_PLANE => 0xFF

    /**
     * @type {Integer (SByte)}
     */
    static PFD_MAIN_PLANE => 0x00

    /**
     * @type {Integer (SByte)}
     */
    static PFD_OVERLAY_PLANE => 0x01
}
