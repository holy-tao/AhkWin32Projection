#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_LB_PROVISIONING_MAP_RESOURCES {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    /**
     * This bitfield backs the following members:
     * - AvailableMappingResourcesValid
     * - UsedMappingResourcesValid
     * - Reserved0
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    AvailableMappingResourcesValid {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    UsedMappingResourcesValid {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield1 >> 2) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 2) | (this._bitfield1 & ~(0x3F << 2))
    }
    Reserved1 : Int8[3]

    /**
     * This bitfield backs the following members:
     * - AvailableMappingResourcesScope
     * - UsedMappingResourcesScope
     * - Reserved2
     */
    _bitfield2 : Int8


    /**
     * @type {Integer}
     */
    AvailableMappingResourcesScope {
        get => (this._bitfield2 >> 0) & 0x3
        set => this._bitfield2 := ((value & 0x3) << 0) | (this._bitfield2 & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    UsedMappingResourcesScope {
        get => (this._bitfield2 >> 2) & 0x3
        set => this._bitfield2 := ((value & 0x3) << 2) | (this._bitfield2 & ~(0x3 << 2))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield2 >> 4) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 4) | (this._bitfield2 & ~(0xF << 4))
    }
    Reserved3 : Int8[3]

    AvailableMappingResources : Int64

    UsedMappingResources : Int64

}
