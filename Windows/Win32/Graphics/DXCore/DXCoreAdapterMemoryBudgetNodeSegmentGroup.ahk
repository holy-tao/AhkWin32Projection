#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a memory segment group for an adapter.
 * @see https://docs.microsoft.com/windows/win32/api//dxcore_interface/ns-dxcore_interface-dxcoreadaptermemorybudgetnodesegmentgroup
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreAdapterMemoryBudgetNodeSegmentGroup extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **uint32_t**
     * 
     * Specifies the device's physical adapter for which the adapter memory information is queried. For single-adapter operation, set this to zero. If there are multiple adapter nodes, then set this to the index of the node (the device's physical adapter) for which you want to query for adapter memory information (see [Multi-adapter](/windows/win32/direct3d12/multi-engine)).
     * @type {Integer}
     */
    nodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[DXCoreSegmentGroup](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoresegmentgroup)**
     * 
     * Specifies the adapter memory segment grouping that you want to query about.
     * @type {Integer}
     */
    segmentGroup {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
