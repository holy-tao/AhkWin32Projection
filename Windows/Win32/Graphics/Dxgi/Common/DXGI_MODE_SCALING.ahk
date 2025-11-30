#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_MODE_SCALING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCALING_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCALING_CENTERED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCALING_STRETCHED => 2
}
