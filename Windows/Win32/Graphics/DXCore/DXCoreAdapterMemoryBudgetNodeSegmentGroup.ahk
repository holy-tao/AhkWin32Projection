#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXCoreSegmentGroup.ahk" { DXCoreSegmentGroup }

/**
 * Describes a memory segment group for an adapter.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ns-dxcore_interface-dxcoreadaptermemorybudgetnodesegmentgroup
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreAdapterMemoryBudgetNodeSegmentGroup {
    #StructPack 4

    /**
     * Type: **uint32_t**
     * 
     * Specifies the device's physical adapter for which the adapter memory information is queried. For single-adapter operation, set this to zero. If there are multiple adapter nodes, then set this to the index of the node (the device's physical adapter) for which you want to query for adapter memory information (see [Multi-adapter](/windows/win32/direct3d12/multi-engine)).
     */
    nodeIndex : UInt32

    /**
     * Type: **[DXCoreSegmentGroup](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoresegmentgroup)**
     * 
     * Specifies the adapter memory segment grouping that you want to query about.
     */
    segmentGroup : DXCoreSegmentGroup

}
