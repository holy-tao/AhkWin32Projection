#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
class DXGI_MODE_ROTATION extends Win32Enum {

    /**
     * Native name: DXGI_MODE_ROTATION_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: DXGI_MODE_ROTATION_IDENTITY
     * @type {Integer (Int32)}
     */
    static IDENTITY => 1

    /**
     * Native name: DXGI_MODE_ROTATION_ROTATE90
     * @type {Integer (Int32)}
     */
    static ROTATE90 => 2

    /**
     * Native name: DXGI_MODE_ROTATION_ROTATE180
     * @type {Integer (Int32)}
     */
    static ROTATE180 => 3

    /**
     * Native name: DXGI_MODE_ROTATION_ROTATE270
     * @type {Integer (Int32)}
     */
    static ROTATE270 => 4
}
