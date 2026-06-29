#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_NODE_CPU_INPUT {
    #StructPack 8

    EntrypointIndex : UInt32

    NumRecords : UInt32

    pRecords : IntPtr

    RecordStrideInBytes : Int64

}
