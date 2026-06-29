#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATSTICS_REFERENCE_DMA_BUFFER {
    #StructPack 4

    NbCall : UInt32

    NbAllocationsReferenced : UInt32

    MaxNbAllocationsReferenced : UInt32

    NbNULLReference : UInt32

    NbWriteReference : UInt32

    NbRenamedAllocationsReferenced : UInt32

    NbIterationSearchingRenamedAllocation : UInt32

    NbLockedAllocationReferenced : UInt32

    NbAllocationWithValidPrepatchingInfoReferenced : UInt32

    NbAllocationWithInvalidPrepatchingInfoReferenced : UInt32

    NbDMABufferSuccessfullyPrePatched : UInt32

    NbPrimariesReferencesOverflow : UInt32

    NbAllocationWithNonPreferredResources : UInt32

    NbAllocationInsertedInMigrationTable : UInt32

}
