#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SUBMITCOMMAND {
    #StructPack 8

    Commands : Int64

    CommandLength : UInt32

    Flags : IntPtr

    PresentHistoryToken : Int64

    BroadcastContextCount : UInt32

    BroadcastContext : UInt32[64]

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    NumPrimaries : UInt32

    WrittenPrimaries : UInt32[16]

    NumHistoryBuffers : UInt32

    HistoryBufferArray : IntPtr

}
