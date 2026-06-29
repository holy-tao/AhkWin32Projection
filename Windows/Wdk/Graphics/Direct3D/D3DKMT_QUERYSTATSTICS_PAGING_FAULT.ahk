#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATSTICS_PAGING_FAULT {
    #StructPack 8

    Faults : IntPtr

    FaultsFirstTimeAccess : IntPtr

    FaultsReclaimed : IntPtr

    FaultsMigration : IntPtr

    FaultsIncorrectResource : IntPtr

    FaultsLostContent : IntPtr

    FaultsEvicted : IntPtr

    AllocationsMEM_RESET : IntPtr

    AllocationsUnresetSuccess : IntPtr

    AllocationsUnresetFail : IntPtr

    AllocationsUnresetSuccessRead : UInt32

    AllocationsUnresetFailRead : UInt32

    Evictions : IntPtr

    EvictionsDueToPreparation : IntPtr

    EvictionsDueToLock : IntPtr

    EvictionsDueToClose : IntPtr

    EvictionsDueToPurge : IntPtr

    EvictionsDueToSuspendCPUAccess : IntPtr

}
