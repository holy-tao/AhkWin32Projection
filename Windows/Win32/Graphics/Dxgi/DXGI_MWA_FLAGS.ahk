#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_MWA_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MWA_NO_WINDOW_CHANGES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MWA_NO_ALT_ENTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MWA_NO_PRINT_SCREEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MWA_VALID => 7
}
