#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS.ahk

/**
 * Describes a raytracing acceleration structure. Pass this structure into ID3D12GraphicsCommandList4::BuildRaytracingAccelerationStructure to describe the acceleration structure to be built.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Location to store resulting acceleration structure.  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device5-getraytracingaccelerationstructureprebuildinfo">ID3D12Device5::GetRaytracingAccelerationStructurePrebuildInfo</a> reports the amount of memory required for the result here given a set of acceleration structure build parameters.  
     * 
     * The address must be aligned to 256 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT</a>.
     * 
     * > [!IMPORTANT]
     * > The memory must be in state [**D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE**](/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states).
     * @type {Integer}
     */
    DestAccelerationStructureData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Description of the input data for the acceleration structure build.  This is data is stored in a separate structure because it is also used with <b>GetRaytracingAccelerationStructurePrebuildInfo</b>.
     * @type {D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS}
     */
    Inputs{
        get {
            if(!this.HasProp("__Inputs"))
                this.__Inputs := D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS(8, this)
            return this.__Inputs
        }
    }

    /**
     * Address of an existing acceleration structure if an acceleration structure update (an incremental build) is being requested, by setting  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_build_flags">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PERFORM_UPDATE</a> in the Flags parameter.  Otherwise this address must be NULL.
     * 
     * If this address is the same as <i>DestAccelerationStructureData</i>, the update is to be performed in-place.  Any other form of overlap of the source and destination memory is invalid and produces undefined behavior.
     * 
     * The address must be aligned to 256 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT</a>, which should automatically be the case because any existing acceleration structure passed in here would have already been required to be placed with such alignment.
     * 
     * > [!IMPORTANT]
     * > The memory must be in state [**D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE**](/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states).
     * @type {Integer}
     */
    SourceAccelerationStructureData {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    ScratchAccelerationStructureData {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
