#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_MWA_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DXGI_MWA_NO_WINDOW_CHANGES
     * @type {Integer (UInt32)}
     */
    static NO_WINDOW_CHANGES => 1

    /**
     * Native name: DXGI_MWA_NO_ALT_ENTER
     * @type {Integer (UInt32)}
     */
    static NO_ALT_ENTER => 2

    /**
     * Native name: DXGI_MWA_NO_PRINT_SCREEN
     * @type {Integer (UInt32)}
     */
    static NO_PRINT_SCREEN => 4

    /**
     * Native name: DXGI_MWA_VALID
     * @type {Integer (UInt32)}
     */
    static VALID => 7
}
