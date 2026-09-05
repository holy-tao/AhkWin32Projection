#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
class DXGI_MODE_SCALING extends Win32Enum {

    /**
     * Native name: DXGI_MODE_SCALING_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: DXGI_MODE_SCALING_CENTERED
     * @type {Integer (Int32)}
     */
    static CENTERED => 1

    /**
     * Native name: DXGI_MODE_SCALING_STRETCHED
     * @type {Integer (Int32)}
     */
    static STRETCHED => 2
}
