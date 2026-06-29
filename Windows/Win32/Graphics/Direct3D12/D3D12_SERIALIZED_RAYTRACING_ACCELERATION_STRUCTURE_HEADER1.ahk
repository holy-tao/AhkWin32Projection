#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER_POSTAMBLE_TYPE.ahk" { D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER_POSTAMBLE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER.ahk" { D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER1 {
    #StructPack 8

    DriverMatchingIdentifier : D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER

    SerializedSizeInBytesIncludingHeader : Int64

    DeserializedSizeInBytes : Int64

    NumBottomLevelAccelerationStructurePointersAfterHeader : UInt32

    HeaderPostambleType : D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER_POSTAMBLE_TYPE

    static __New() {
        DefineProp(this.Prototype, 'NumBlocks', { type: UInt32, offset: 48 })
        this.DeleteProp("__New")
    }
}
