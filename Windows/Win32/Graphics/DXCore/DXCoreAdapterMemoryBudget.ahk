#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the memory budget for an adapter.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ns-dxcore_interface-dxcoreadaptermemorybudget
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreAdapterMemoryBudget {
    #StructPack 8

    /**
     * Type: **uint64_t**
     * 
     * Specifies the OS-provided adapter memory budget, in bytes, that your application should target. If *currentUsage* is greater than *budget*, then your application may incur stuttering or performance penalties due to background activity by the OS, which is intended to provide other applications with a fair usage of adapter memory.
     */
    budget : Int64

    currentUsage : Int64

    /**
     * Type: **uint64_t**
     * 
     * Specifies the amount of adapter memory, in bytes, that your application has available for reservation. To reserve this adapter memory, your application should call [IDXCoreAdapter::SetState](/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-setstate) with *state* set to [DXCoreAdapterState::AdapterMemoryBudget](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate).
     */
    availableForReservation : Int64

    currentReservation : Int64

}
