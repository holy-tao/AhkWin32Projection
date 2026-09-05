#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_SCHEDULINGPRIORITYCLASS extends Win32Enum {

    /**
     * Native name: D3DKMT_SCHEDULINGPRIORITYCLASS_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 0

    /**
     * Native name: D3DKMT_SCHEDULINGPRIORITYCLASS_BELOW_NORMAL
     * @type {Integer (Int32)}
     */
    static BELOW_NORMAL => 1

    /**
     * Native name: D3DKMT_SCHEDULINGPRIORITYCLASS_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 2

    /**
     * Native name: D3DKMT_SCHEDULINGPRIORITYCLASS_ABOVE_NORMAL
     * @type {Integer (Int32)}
     */
    static ABOVE_NORMAL => 3

    /**
     * Native name: D3DKMT_SCHEDULINGPRIORITYCLASS_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 4

    /**
     * Native name: D3DKMT_SCHEDULINGPRIORITYCLASS_REALTIME
     * @type {Integer (Int32)}
     */
    static REALTIME => 5
}
