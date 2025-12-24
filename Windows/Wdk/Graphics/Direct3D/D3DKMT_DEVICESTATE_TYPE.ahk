#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_DEVICESTATE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICESTATE_EXECUTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICESTATE_PRESENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICESTATE_RESET => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICESTATE_PRESENT_DWM => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICESTATE_PAGE_FAULT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICESTATE_PRESENT_QUEUE => 6
}
