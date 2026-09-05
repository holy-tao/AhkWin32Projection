#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
class PFD_LAYER_TYPE extends Win32Enum {

    /**
     * Native name: PFD_UNDERLAY_PLANE
     * @type {Integer (SByte)}
     */
    static UNDERLAY_PLANE => 0xFF

    /**
     * Native name: PFD_MAIN_PLANE
     * @type {Integer (SByte)}
     */
    static MAIN_PLANE => 0x00

    /**
     * Native name: PFD_OVERLAY_PLANE
     * @type {Integer (SByte)}
     */
    static OVERLAY_PLANE => 0x01
}
