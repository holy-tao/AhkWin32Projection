#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_QUERYREGISTRY_STATUS extends Win32Enum {

    /**
     * Native name: D3DDDI_QUERYREGISTRY_STATUS_SUCCESS
     * @type {Integer (Int32)}
     */
    static SUCCESS => 0

    /**
     * Native name: D3DDDI_QUERYREGISTRY_STATUS_BUFFER_OVERFLOW
     * @type {Integer (Int32)}
     */
    static BUFFER_OVERFLOW => 1

    /**
     * Native name: D3DDDI_QUERYREGISTRY_STATUS_FAIL
     * @type {Integer (Int32)}
     */
    static FAIL => 2

    /**
     * Native name: D3DDDI_QUERYREGISTRY_STATUS_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
