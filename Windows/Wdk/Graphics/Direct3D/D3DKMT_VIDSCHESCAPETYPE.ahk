#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_VIDSCHESCAPETYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_PREEMPTIONCONTROL
     * @type {Integer (Int32)}
     */
    static PREEMPTIONCONTROL => 0

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_SUSPENDSCHEDULER
     * @type {Integer (Int32)}
     */
    static SUSPENDSCHEDULER => 1

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_TDRCONTROL
     * @type {Integer (Int32)}
     */
    static TDRCONTROL => 2

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_SUSPENDRESUME
     * @type {Integer (Int32)}
     */
    static SUSPENDRESUME => 3

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_ENABLECONTEXTDELAY
     * @type {Integer (Int32)}
     */
    static ENABLECONTEXTDELAY => 4

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_CONFIGURE_TDR_LIMIT
     * @type {Integer (Int32)}
     */
    static CONFIGURE_TDR_LIMIT => 5

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_VGPU_RESET
     * @type {Integer (Int32)}
     */
    static VGPU_RESET => 6

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_PFN_CONTROL
     * @type {Integer (Int32)}
     */
    static PFN_CONTROL => 7

    /**
     * Native name: D3DKMT_VIDSCHESCAPETYPE_VIRTUAL_REFRESH_RATE
     * @type {Integer (Int32)}
     */
    static VIRTUAL_REFRESH_RATE => 8
}
