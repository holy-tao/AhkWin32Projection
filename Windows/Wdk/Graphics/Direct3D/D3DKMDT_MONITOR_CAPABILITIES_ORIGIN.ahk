#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_CAPABILITIES_ORIGIN extends Win32Enum {

    /**
     * Native name: D3DKMDT_MCO_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MCO_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MCO_DEFAULTMONITORPROFILE
     * @type {Integer (Int32)}
     */
    static MCO_DEFAULTMONITORPROFILE => 1

    /**
     * Native name: D3DKMDT_MCO_MONITORDESCRIPTOR
     * @type {Integer (Int32)}
     */
    static MCO_MONITORDESCRIPTOR => 2

    /**
     * Native name: D3DKMDT_MCO_MONITORDESCRIPTOR_REGISTRYOVERRIDE
     * @type {Integer (Int32)}
     */
    static MCO_MONITORDESCRIPTOR_REGISTRYOVERRIDE => 3

    /**
     * Native name: D3DKMDT_MCO_SPECIFICCAP_REGISTRYOVERRIDE
     * @type {Integer (Int32)}
     */
    static MCO_SPECIFICCAP_REGISTRYOVERRIDE => 4

    /**
     * Native name: D3DKMDT_MCO_DRIVER
     * @type {Integer (Int32)}
     */
    static MCO_DRIVER => 5
}
