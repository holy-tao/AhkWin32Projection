#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_DRIVERESCAPETYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DRIVERESCAPETYPE_TRANSLATEALLOCATIONHANDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DRIVERESCAPETYPE_TRANSLATERESOURCEHANDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DRIVERESCAPETYPE_CPUEVENTUSAGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DRIVERESCAPETYPE_MAX => 3
}
