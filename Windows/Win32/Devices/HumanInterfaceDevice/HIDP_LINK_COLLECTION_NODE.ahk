#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDP_LINK_COLLECTION_NODE {
    #StructPack 8

    LinkUsage : UInt16

    LinkUsagePage : UInt16

    Parent : UInt16

    NumberOfChildren : UInt16

    NextSibling : UInt16

    FirstChild : UInt16

    /**
     * This bitfield backs the following members:
     * - CollectionType
     * - IsAlias
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    CollectionType {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    IsAlias {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }
    UserContext : IntPtr

}
