#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an instance of a raytracing acceleration structure used in GPU memory during the acceleration structure build process.
 * @remarks
 * This C++ struct definition is useful if you're generating instance data on the CPU first, then uploading to the GPU. But your application is also free to generate instance descriptions directly into GPU memory (from compute shaders, for instance) following the same layout.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_instance_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_INSTANCE_DESC {
    #StructPack 8

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types) \[3\]\[4\]**
     * 
     * A 3x4 transform matrix in row-major layout representing the instance-to-world transformation. Implementations transform rays, as opposed to transforming all of the geometry or AABBs.
     * 
     * > [!NOTE]
     * > The layout of `Transform` is a transpose of how affine matrices are typically stored in memory. Instead of four 3-vectors, `Transform` is laid out as three 4-vectors.
     */
    Transform : Float32[12]

    /**
     * This bitfield backs the following members:
     * - InstanceID
     * - InstanceMask
     */
    _bitfield1 : Int32


    /**
     * @type {Integer}
     */
    InstanceID {
        get => (this._bitfield1 >> 0) & 0xFFFFFF
        set => this._bitfield1 := ((value & 0xFFFFFF) << 0) | (this._bitfield1 & ~(0xFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    InstanceMask {
        get => (this._bitfield1 >> 24) & 0xFF
        set => this._bitfield1 := ((value & 0xFF) << 24) | (this._bitfield1 & ~(0xFF << 24))
    }
    /**
     * This bitfield backs the following members:
     * - InstanceContributionToHitGroupIndex
     * - Flags
     */
    _bitfield2 : Int32


    /**
     * @type {Integer}
     */
    InstanceContributionToHitGroupIndex {
        get => (this._bitfield2 >> 0) & 0xFFFFFF
        set => this._bitfield2 := ((value & 0xFFFFFF) << 0) | (this._bitfield2 & ~(0xFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => (this._bitfield2 >> 24) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 24) | (this._bitfield2 & ~(0xFF << 24))
    }
    /**
     * Type: **[D3D12_GPU_VIRTUAL_ADDRESS](/windows/win32/direct3d12/d3d12_gpu_virtual_address)**
     * 
     * Address of the bottom-level acceleration structure that is being instanced. The address must be aligned to 256 bytes, defined as [D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT](/windows/win32/direct3d12/constants). Any existing acceleration structure passed in here would already have been required to be placed with such alignment.
     * 
     * The memory pointed to must be in state [D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE](./ne-d3d12-d3d12_resource_states.md).
     */
    AccelerationStructure : Int64

}
