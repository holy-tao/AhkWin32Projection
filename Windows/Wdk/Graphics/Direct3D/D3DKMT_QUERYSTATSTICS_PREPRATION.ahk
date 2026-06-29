#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATSTICS_PREPRATION {
    #StructPack 8

    BroadcastStall : UInt32

    NbDMAPrepared : UInt32

    NbDMAPreparedLongPath : UInt32

    ImmediateHighestPreparationPass : UInt32

    AllocationsTrimmed : IntPtr

}
