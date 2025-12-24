#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_MONITOR_CAPABILITIES_ORIGIN extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_DEFAULTMONITORPROFILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_MONITORDESCRIPTOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_MONITORDESCRIPTOR_REGISTRYOVERRIDE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_SPECIFICCAP_REGISTRYOVERRIDE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_DRIVER => 5
}
