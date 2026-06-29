#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATSTICS_RENAMING {
    #StructPack 4

    NbAllocationsRenamed : UInt32

    NbAllocationsShrinked : UInt32

    NbRenamedBuffer : UInt32

    MaxRenamingListLength : UInt32

    NbFailuresDueToRenamingLimit : UInt32

    NbFailuresDueToCreateAllocation : UInt32

    NbFailuresDueToOpenAllocation : UInt32

    NbFailuresDueToLowResource : UInt32

    NbFailuresDueToNonRetiredLimit : UInt32

}
