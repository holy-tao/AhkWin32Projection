#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_QUERYREGISTRY_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_STATUS_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_STATUS_BUFFER_OVERFLOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_STATUS_FAIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_STATUS_MAX => 3
}
