#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_POOL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIPOOL_SYSTEMMEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIPOOL_VIDEOMEMORY => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIPOOL_LOCALVIDMEM => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIPOOL_NONLOCALVIDMEM => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIPOOL_STAGINGMEM => 5
}
