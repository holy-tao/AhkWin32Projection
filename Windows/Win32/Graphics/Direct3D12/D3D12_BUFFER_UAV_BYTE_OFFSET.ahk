#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_BUFFER_UAV_FLAGS.ahk" { D3D12_BUFFER_UAV_FLAGS }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_BUFFER_UAV_BYTE_OFFSET {
    #StructPack 8

    Offset : Int64

    Size : Int64

    StructureByteStride : UInt32

    CounterOffsetInBytes : Int64

    Flags : D3D12_BUFFER_UAV_FLAGS

}
