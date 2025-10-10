#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_HARDWARE_SCHEDULING_QUEUE_GROUPINGS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ComputeQueuesPer3DQueue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
