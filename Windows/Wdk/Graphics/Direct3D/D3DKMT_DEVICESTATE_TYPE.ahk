#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DEVICESTATE_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_DEVICESTATE_EXECUTION
     * @type {Integer (Int32)}
     */
    static EXECUTION => 1

    /**
     * Native name: D3DKMT_DEVICESTATE_PRESENT
     * @type {Integer (Int32)}
     */
    static PRESENT => 2

    /**
     * Native name: D3DKMT_DEVICESTATE_RESET
     * @type {Integer (Int32)}
     */
    static RESET => 3

    /**
     * Native name: D3DKMT_DEVICESTATE_PRESENT_DWM
     * @type {Integer (Int32)}
     */
    static PRESENT_DWM => 4

    /**
     * Native name: D3DKMT_DEVICESTATE_PAGE_FAULT
     * @type {Integer (Int32)}
     */
    static PAGE_FAULT => 5

    /**
     * Native name: D3DKMT_DEVICESTATE_PRESENT_QUEUE
     * @type {Integer (Int32)}
     */
    static PRESENT_QUEUE => 6
}
