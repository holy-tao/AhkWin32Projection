#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_BASE_DESKTOP_DURATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_VSYNC_MULTIPLIER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE_SET_PROCESS_BOOST_ELIGIBLE => 2
}
