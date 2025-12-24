#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_SCHEDULINGPRIORITYCLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_BELOW_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_ABOVE_NORMAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_HIGH => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_REALTIME => 5
}
