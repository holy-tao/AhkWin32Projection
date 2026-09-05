#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_DRIVERESCAPETYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_DRIVERESCAPETYPE_TRANSLATEALLOCATIONHANDLE
     * @type {Integer (Int32)}
     */
    static TRANSLATEALLOCATIONHANDLE => 0

    /**
     * Native name: D3DDDI_DRIVERESCAPETYPE_TRANSLATERESOURCEHANDLE
     * @type {Integer (Int32)}
     */
    static TRANSLATERESOURCEHANDLE => 1

    /**
     * Native name: D3DDDI_DRIVERESCAPETYPE_CPUEVENTUSAGE
     * @type {Integer (Int32)}
     */
    static CPUEVENTUSAGE => 2

    /**
     * Native name: D3DDDI_DRIVERESCAPETYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
