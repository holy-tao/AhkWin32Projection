#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the memory budget for an adapter.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ns-dxcore_interface-dxcoreadaptermemorybudget
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreAdapterMemoryBudget extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **uint64_t**
     * 
     * Specifies the OS-provided adapter memory budget, in bytes, that your application should target. If *currentUsage* is greater than *budget*, then your application may incur stuttering or performance penalties due to background activity by the OS, which is intended to provide other applications with a fair usage of adapter memory.
     * @type {Integer}
     */
    budget {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    currentUsage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **uint64_t**
     * 
     * Specifies the amount of adapter memory, in bytes, that your application has available for reservation. To reserve this adapter memory, your application should call [IDXCoreAdapter::SetState](/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-setstate) with *state* set to [DXCoreAdapterState::AdapterMemoryBudget](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate).
     * @type {Integer}
     */
    availableForReservation {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    currentReservation {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
