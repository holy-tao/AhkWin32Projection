#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_MODE_SCANLINE_ORDER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST => 3
}
