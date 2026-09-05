#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_BASE_DESKTOP_DURATION
     * @type {Integer (Int32)}
     */
    static SET_BASE_DESKTOP_DURATION => 0

    /**
     * Native name: D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_VSYNC_MULTIPLIER
     * @type {Integer (Int32)}
     */
    static SET_VSYNC_MULTIPLIER => 1

    /**
     * Native name: D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_PROCESS_BOOST_ELIGIBLE
     * @type {Integer (Int32)}
     */
    static SET_PROCESS_BOOST_ELIGIBLE => 2
}
