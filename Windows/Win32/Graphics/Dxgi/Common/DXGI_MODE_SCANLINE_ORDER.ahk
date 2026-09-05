#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
class DXGI_MODE_SCANLINE_ORDER extends Win32Enum {

    /**
     * Native name: DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE
     * @type {Integer (Int32)}
     */
    static PROGRESSIVE => 1

    /**
     * Native name: DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST
     * @type {Integer (Int32)}
     */
    static UPPER_FIELD_FIRST => 2

    /**
     * Native name: DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST
     * @type {Integer (Int32)}
     */
    static LOWER_FIELD_FIRST => 3
}
