#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Opaque data structure describing driver versioning for a serialized acceleration structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_serialized_data_driver_matching_identifier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER {
    #StructPack 4

    /**
     * The opaque identifier of the driver.
     */
    DriverOpaqueGUID : Guid

    /**
     * The opaque driver versioning data.
     */
    DriverOpaqueVersioningData : Int8[16]

}
