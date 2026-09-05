#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMDT_VPPMT_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static VPPMT_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_VPPMT_NOPROTECTION
     * @type {Integer (Int32)}
     */
    static VPPMT_NOPROTECTION => 1

    /**
     * Native name: D3DKMDT_VPPMT_MACROVISION_APSTRIGGER
     * @type {Integer (Int32)}
     */
    static VPPMT_MACROVISION_APSTRIGGER => 2

    /**
     * Native name: D3DKMDT_VPPMT_MACROVISION_FULLSUPPORT
     * @type {Integer (Int32)}
     */
    static VPPMT_MACROVISION_FULLSUPPORT => 3
}
