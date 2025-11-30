#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPMT_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPMT_NOPROTECTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPMT_MACROVISION_APSTRIGGER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPMT_MACROVISION_FULLSUPPORT => 3
}
