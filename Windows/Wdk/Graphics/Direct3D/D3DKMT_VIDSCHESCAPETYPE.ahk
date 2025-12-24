#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_VIDSCHESCAPETYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_PREEMPTIONCONTROL => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_SUSPENDSCHEDULER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_TDRCONTROL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_SUSPENDRESUME => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_ENABLECONTEXTDELAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_CONFIGURE_TDR_LIMIT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_VGPU_RESET => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_PFN_CONTROL => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDSCHESCAPETYPE_VIRTUAL_REFRESH_RATE => 8
}
