#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_QUERYREGISTRY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_SERVICEKEY => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_ADAPTERKEY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_DRIVERSTOREPATH => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_DRIVERIMAGEPATH => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_MAX => 4
}
