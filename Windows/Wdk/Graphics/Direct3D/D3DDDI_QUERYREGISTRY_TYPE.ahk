#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_QUERYREGISTRY_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_QUERYREGISTRY_SERVICEKEY
     * @type {Integer (Int32)}
     */
    static SERVICEKEY => 0

    /**
     * Native name: D3DDDI_QUERYREGISTRY_ADAPTERKEY
     * @type {Integer (Int32)}
     */
    static ADAPTERKEY => 1

    /**
     * Native name: D3DDDI_QUERYREGISTRY_DRIVERSTOREPATH
     * @type {Integer (Int32)}
     */
    static DRIVERSTOREPATH => 2

    /**
     * Native name: D3DDDI_QUERYREGISTRY_DRIVERIMAGEPATH
     * @type {Integer (Int32)}
     */
    static DRIVERIMAGEPATH => 3

    /**
     * Native name: D3DDDI_QUERYREGISTRY_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 4
}
