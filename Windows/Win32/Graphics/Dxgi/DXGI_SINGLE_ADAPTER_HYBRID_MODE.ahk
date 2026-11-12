#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_SINGLE_ADAPTER_HYBRID_MODE extends Win32Enum {

    /**
     * Native name: DXGI_SINGLE_ADAPTER_HYBRID_MODE_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: DXGI_SINGLE_ADAPTER_HYBRID_MODE_MINIMUM_POWER
     * @type {Integer (Int32)}
     */
    static MINIMUM_POWER => 1

    /**
     * Native name: DXGI_SINGLE_ADAPTER_HYBRID_MODE_HIGH_PERFORMANCE
     * @type {Integer (Int32)}
     */
    static HIGH_PERFORMANCE => 2
}
