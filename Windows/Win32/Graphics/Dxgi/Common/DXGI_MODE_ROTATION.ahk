#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_MODE_ROTATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_IDENTITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_ROTATE90 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_ROTATE180 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_ROTATE270 => 4
}
