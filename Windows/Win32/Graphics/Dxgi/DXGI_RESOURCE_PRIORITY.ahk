#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_RESOURCE_PRIORITY extends Win32Enum {

    /**
     * Native name: DXGI_RESOURCE_PRIORITY_MINIMUM
     * @type {Integer (UInt32)}
     */
    static MINIMUM => 671088640

    /**
     * Native name: DXGI_RESOURCE_PRIORITY_LOW
     * @type {Integer (UInt32)}
     */
    static LOW => 1342177280

    /**
     * Native name: DXGI_RESOURCE_PRIORITY_NORMAL
     * @type {Integer (UInt32)}
     */
    static NORMAL => 2013265920

    /**
     * Native name: DXGI_RESOURCE_PRIORITY_HIGH
     * @type {Integer (UInt32)}
     */
    static HIGH => 2684354560

    /**
     * Native name: DXGI_RESOURCE_PRIORITY_MAXIMUM
     * @type {Integer (UInt32)}
     */
    static MAXIMUM => 3355443200
}
